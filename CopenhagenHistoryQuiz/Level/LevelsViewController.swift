import UIKit

final class LevelsViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Levels"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    private let gameType: GameType
    private var collectionView: UICollectionView!
    
    private let reuseIdentifier = "LevelCell"
    
    init(gameType: GameType) {
        self.gameType = gameType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        setBackImage()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 75, left: 25, bottom: 5, right: 25)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LevelCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        view.addSubview(dismissButton)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            dismissButton.widthAnchor.constraint(equalToConstant: 50),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            titleLabel.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
        ])
    }
    
    private func loadOpenLevels() -> [Bool] {
        switch gameType {
        case .guessPerson:
            return CopenDa.openLevels["guessPerson"] ?? []
        case .guessYear:
            return CopenDa.openLevels["guessYear"] ?? []
        case .quiz:
            return CopenDa.openLevels["quiz"] ?? []
        }
    }
    
    private func loadStarsForLevels() -> [Int] {
        switch gameType {
        case .guessPerson:
            return CopenDa.startForLevels["guessPerson"] ?? []
        case .guessYear:
            return CopenDa.startForLevels["guessYear"] ?? []
        case .quiz:
            return CopenDa.startForLevels["quiz"] ?? []
        }
    }
}

extension LevelsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LevelCell
        
        let openLevels = loadOpenLevels()
        let starsForLevels = loadStarsForLevels()
        cell.configure(level: indexPath.item + 1, isOpen: openLevels[indexPath.item], stars: starsForLevels[indexPath.item])
        
        return cell
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LevelsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let openLevels = loadOpenLevels()
        
        if openLevels[indexPath.item] {
            let gameVC = GameViewController(level: indexPath.item, gameType: gameType)
            gameVC.modalPresentationStyle = .fullScreen
            gameVC.completionHandler = { [weak self] in
                self?.checkNextLevel(index: indexPath.item)
            }
            present(gameVC, animated: true, completion: nil)
        }
    }
    
    private func checkNextLevel(index: Int) {
        collectionView.reloadData()
    }
}

