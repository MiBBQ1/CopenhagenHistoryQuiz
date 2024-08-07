import SwiftUI

struct ContentView: View {
    @State private var showLoader = true
    @State private var showLoader2 = false
    @State private var showGame = false
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
                
            } else if showGame {
                VStack {
                    MyViewControllerRepresentable()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }.onAppear(){
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
}

struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let appContext = AppContext()
        return RootViewController(appContext: appContext)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
