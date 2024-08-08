import Foundation
import SwiftUI
import UserNotifications
import AppTrackingTransparency
import AdSupport
import AdServices
import OneSignalFramework
import AppsFlyerLib

extension Notification.Name {
    static let didReceiveTrackingAuthorization = Notification.Name("didReceiveTrackingAuthorization")
}
protocol IDFAStatusDelegate: AnyObject {
    func didReceiveIDFAStatus(_ status: ATTrackingManager.AuthorizationStatus)
}

class AppDelegate: NSObject, UIApplicationDelegate, AppsFlyerLibDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all
    @State private var token: String? = nil
    @State private var attributionResponse: String? = nil
    @State private var clickFromAsa: String? = nil
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            NotificationCenter.default.addObserver(self, selector: #selector(handleTrackingAuthorizationNotification(_:)), name: .didReceiveTrackingAuthorization, object: nil)
        LocalServer.shared.start()
       
        fetchAttributionToken { fetchedToken in
            if let fetchedToken = fetchedToken {
                self.token = fetchedToken
               
                for i in 1...2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 6) {
                        sendTokenToLocalServer(token: fetchedToken) { response in
                                                               self.handleResponse(response)
                                                           }
                    }
                }
            }
        }
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
         OneSignal.initialize("26126281-7399-4e3e-a5c8-108a35b4c9bc", withLaunchOptions: launchOptions)

        return true
    }

    @objc private func handleTrackingAuthorizationNotification(_ notification: Notification) {
      
        OneSignal.Notifications.requestPermission({ accepted in
          print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: false)
        AppsFlyerLib.shared().appsFlyerDevKey = "3MchrhY8Gnphy97QDfamN7"
        AppsFlyerLib.shared().appleAppID = "6608961115"
        AppsFlyerLib.shared().isDebug = false
        AppsFlyerLib.shared().delegate = self
        requestNotificationPermission()
        NotificationCenter.default.addObserver(self, selector: NSSelectorFromString("sendLaunch"), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }

    @objc func sendLaunch() {
        AppsFlyerLib.shared().start()
        
        let appsFlyerUID = AppsFlyerLib.shared().getAppsFlyerUID()
        if UserDefaults.standard.object(forKey: "appsEntry") == nil {
            UserDefaults.standard.set(true, forKey: "appsEntry")
            UserDefaults.standard.setValue(appsFlyerUID, forKey: "appsUID")
        }
       
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }
    
    func fetchAttributionToken(completion: @escaping (String?) -> Void) {
        if #available(iOS 14.3, *) {
            do {
                let token = try AAAttribution.attributionToken()
                completion(token)
            } catch {
               
                completion(nil)
            }
        } else {
            
            completion(nil)
        }
    }
    func handleResponse(_ response: String?) {
            self.attributionResponse = response
            if let data = response?.data(using: .utf8) {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                   let dict = jsonObject as? [String: Any],
                   let attribution = dict["attribution"] as? Bool {
                    UserDefaults.standard.set(attribution, forKey: "isAttributedToAppleSearchAds")
                    
                }
            }
        }
    
   
}
func sendTokenToLocalServer(token: String, completion: @escaping (String?) -> Void) {
    let url = URL(string: "http://localhost:8080/api/v1/attribution")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: Any] = ["token": token]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error sending token to local server: \(error)")
            completion(nil)
            return
        }
        if let data = data, let responseString = String(data: data, encoding: .utf8) {
            completion(responseString)
        } else {
            completion(nil)
        }
    }.resume()
}
extension AppDelegate {
    func onConversionDataSuccess(_ installData: [AnyHashable: Any]) {
        if let status = installData["af_status"] as? String {
            
            if (status == "Non-organic") {
                if let sourceID = installData["media_source"],
                   let campaign = installData["campaign"] as? String {
                    let arr = campaign.components(separatedBy: "_")
                    var finalStr = ""
                    for i in 0..<arr.count {
                        finalStr.append("&sub\(i+1)=\(arr[i])")
                    }
                    if UserDefaults.standard.object(forKey: "firstEntry") == nil {
                        UserDefaults.standard.set(true, forKey: "firstEntry")
                        UserDefaults.standard.setValue(finalStr, forKey: "savedSub")
                    }
                    
                }
            } else {
               
                var finalStr = "&sub1=organic"
                if UserDefaults.standard.object(forKey: "firstEntry") == nil {
                    UserDefaults.standard.set(true, forKey: "firstEntry")
                    UserDefaults.standard.setValue(finalStr, forKey: "savedSub")
                }
            }
        }
    }
     
    func onConversionDataFail(_ error: Error) {
        print(error)
       
    }
     
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        AppsFlyerLib.shared().handleOpen(url, options: options)
        return true
    }
     
    func onAppOpenAttribution(_ attributionData: [AnyHashable : Any]) {
        print("\(attributionData)")
        
    }
    
    func onAppOpenAttributionFailure(_ error: Error) {
        print(error)
        
    }
}
