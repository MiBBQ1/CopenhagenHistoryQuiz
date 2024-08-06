import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    lazy var dismissButton: UIButton = {
       let button = UIButton(type: .system)
        button.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.color(0xFFD700).cgColor
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "button"), for: .normal)
        button.setImage(UIImage(named: "arrow")!.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return button
    }()
    
    var completionHandler: (() -> Void)?
    private let level: Int
    private let gameType: GameType
    
    var skView: SKView!
    
    init(level: Int, gameType: GameType) {
        self.level = level
        self.gameType = gameType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView = SKView(frame: view.bounds)
        view.addSubview(skView)
        if gameType == .guessPerson {
            let scene = GameScene(size: view.frame.size)
            scene.currentLevel = self.level
            scene.deleg = self
            scene.gameType = gameType
            skView.presentScene(scene)
        }
        else {
            let scene = WonderGameScene(size: view.frame.size)
            scene.currentLevel = self.level
            scene.deleg = self
            scene.gameType = gameType
            skView.presentScene(scene)
        }
        
        self.view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.widthAnchor.constraint(equalToConstant: 50),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            ])
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true) {
            self.completionHandler?()
        }
    }
}

extension GameViewController: QuizeSceneDelegate {
    func dismisMe() {
        dismiss(animated: true) {
            self.completionHandler?()
        }
    }
}
