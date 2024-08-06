import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MyViewControllerRepresentable()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let appContext = AppContext()
        return RootViewController(appContext: appContext)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
