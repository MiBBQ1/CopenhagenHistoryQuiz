import UIKit

final class AppContext {
    var rootViewController: UIViewController?

    init() {
        Player.shared.loadUserDefaults()
    }

    public func startApp(in rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        let vcMenu = MainViewController()
        setRootViewController(vcMenu)
    }

    private func setRootViewController(_ viewController: UIViewController) {
        guard let rootViewController = rootViewController else { return }
        addChild(viewController, to: rootViewController)
    }

    private func addChild(_ child: UIViewController, to parent: UIViewController) {
        parent.addChild(child)
        parent.view.addSubview(child.view)
        child.view.frame = parent.view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child.didMove(toParent: parent)
    }
}


class RootViewController: UIViewController {
    private let appContext: AppContext

    init(appContext: AppContext) {
        self.appContext = appContext
        super.init(nibName: nil, bundle: nil)
        appContext.startApp(in: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
