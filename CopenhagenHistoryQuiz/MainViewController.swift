import UIKit

final class MainViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Welcome To Copenhagen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let wonderPeoplesLearnMoreButton = UIButton(type: .system)
    
    private let wonderPeoplesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Wonder People:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let CityHistoryLearnMoreButton = UIButton(type: .system)
    private let CityHistoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "City History:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
         button.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
         button.layer.cornerRadius = 25
         button.layer.borderColor = UIColor.color(0xFFD700).cgColor
         button.layer.borderWidth = 2
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setBackgroundImage(UIImage(named: "button"), for: .normal)
         button.setImage(UIImage(named: "settings")!.withRenderingMode(.alwaysOriginal), for: .normal)
         button.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
         button.imageView?.contentMode = .scaleAspectFit
         button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
         button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
         return button
    }()

    private let leftArrowButton = UIButton(type: .system)
    private let rightArrowButton = UIButton(type: .system)
    public var pageControlView: copenSlider!
    private let layout = UICollectionViewFlowLayout()
    private var collectionView: UICollectionView!
    
    private let articlesLayout = UICollectionViewFlowLayout()
    private var articlesCollection: UICollectionView!
    
    private let CityHistoryLayout = UICollectionViewFlowLayout()
    private var CityHistoryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        viewsAutoLayout()
    }
    
    
    private func setView() {
        setBackImage()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        articlesCollection = UICollectionView(frame: .zero, collectionViewLayout: articlesLayout)
        articlesCollection.backgroundColor = .clear
        articlesCollection.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCell")
        articlesCollection.delegate = self
        articlesCollection.dataSource = self
        articlesCollection.showsHorizontalScrollIndicator = false
        articlesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        //articlesCollection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        articlesLayout.itemSize = CGSize(width: 283, height: 146)
        articlesLayout.scrollDirection = .horizontal
        
        CityHistoryCollection = UICollectionView(frame: .zero, collectionViewLayout: CityHistoryLayout)
        CityHistoryCollection.backgroundColor = .clear
        CityHistoryCollection.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCell")
        CityHistoryCollection.delegate = self
        CityHistoryCollection.dataSource = self
        CityHistoryCollection.showsHorizontalScrollIndicator = false
        CityHistoryCollection.translatesAutoresizingMaskIntoConstraints = false
        //CityHistoryCollection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: -16)
        CityHistoryLayout.itemSize = CGSize(width: 283, height: 146)
        CityHistoryLayout.scrollDirection = .horizontal
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        wonderPeoplesLearnMoreButton.setTitle("Show more", for: .normal)
        wonderPeoplesLearnMoreButton.setTitleColor(.color(0x207C4C), for: .normal)
        wonderPeoplesLearnMoreButton.titleLabel?.font = .InikaBold(ofSize: 20)
        wonderPeoplesLearnMoreButton.addTarget(self, action: #selector(openWonderPeoples), for: .touchUpInside)
        wonderPeoplesLearnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        CityHistoryLearnMoreButton.setTitle("Show more", for: .normal)
        CityHistoryLearnMoreButton.setTitleColor(.color(0x207C4C), for: .normal)
        CityHistoryLearnMoreButton.titleLabel?.font = .InikaBold(ofSize: 20)
        CityHistoryLearnMoreButton.addTarget(self, action: #selector(openCityHistory), for: .touchUpInside)
        CityHistoryLearnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 256)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 25, bottom: 5, right: 25)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(GamesCollectionViewCell.self, forCellWithReuseIdentifier: "GamesCollectionViewCell")
        
        pageControlView = copenSlider(numberOfPages: games.count)
        pageControlView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControlView)
        contentView.addSubview(articlesCollection)
        contentView.addSubview(wonderPeoplesLabel)
        contentView.addSubview(CityHistoryLabel)
        contentView.addSubview(CityHistoryCollection)
        contentView.addSubview(CityHistoryLearnMoreButton)
        contentView.addSubview(wonderPeoplesLearnMoreButton)
        contentView.addSubview(settingsButton)
        
        leftArrowButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        leftArrowButton.tintColor = .white
        leftArrowButton.addTarget(self, action: #selector(leftArrowTapped), for: .touchUpInside)
        leftArrowButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(leftArrowButton)

        rightArrowButton.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        rightArrowButton.tintColor = .white
        rightArrowButton.addTarget(self, action: #selector(rightArrowTapped), for: .touchUpInside)
        rightArrowButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rightArrowButton)
    }
    
    private func viewsAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 74),
            titleLabel.leftAnchor.constraint(equalTo: settingsButton.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 256),
            
            pageControlView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -15),
            pageControlView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControlView.heightAnchor.constraint(equalToConstant: 30),
            pageControlView.widthAnchor.constraint(equalToConstant: 135),
            
            leftArrowButton.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            leftArrowButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            leftArrowButton.widthAnchor.constraint(equalToConstant: 44),
            leftArrowButton.heightAnchor.constraint(equalToConstant: 44),

            rightArrowButton.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            rightArrowButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            rightArrowButton.widthAnchor.constraint(equalToConstant: 44),
            rightArrowButton.heightAnchor.constraint(equalToConstant: 44),
            
            wonderPeoplesLabel.topAnchor.constraint(equalTo: pageControlView.bottomAnchor, constant: 20),
            wonderPeoplesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            wonderPeoplesLearnMoreButton.centerYAnchor.constraint(equalTo: wonderPeoplesLabel.centerYAnchor),
            wonderPeoplesLearnMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            articlesCollection.topAnchor.constraint(equalTo: wonderPeoplesLabel.bottomAnchor, constant: 10),
            articlesCollection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            articlesCollection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            articlesCollection.heightAnchor.constraint(equalToConstant: 146),
            
            
            CityHistoryLabel.topAnchor.constraint(equalTo: articlesCollection.bottomAnchor, constant: 20),
            CityHistoryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            CityHistoryLearnMoreButton.centerYAnchor.constraint(equalTo: CityHistoryLabel.centerYAnchor),
            CityHistoryLearnMoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            CityHistoryCollection.topAnchor.constraint(equalTo: CityHistoryLabel.bottomAnchor, constant: 10),
            CityHistoryCollection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            CityHistoryCollection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            CityHistoryCollection.heightAnchor.constraint(equalToConstant: 146),
            CityHistoryCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            settingsButton.widthAnchor.constraint(equalToConstant: 50),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 0),
            settingsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
        ])
    }
    @objc func openWonderPeoples() {
        let wonderMoreVc = WonderPeopleMoreViewController()
        wonderMoreVc.modalPresentationStyle = .fullScreen
        self.present(wonderMoreVc, animated: true)
    }
    @objc func openCityHistory() {
        let CityHistoryMoreVc = CityHistoryMoreViewController()
        CityHistoryMoreVc.modalPresentationStyle = .fullScreen
        self.present(CityHistoryMoreVc, animated: true)
    }
    
    @objc func leftArrowTapped() {
        let currentOffset = collectionView.contentOffset
        let newOffset = CGPoint(x: max(currentOffset.x - layout.itemSize.width, 0), y: currentOffset.y)
        collectionView.setContentOffset(newOffset, animated: true)
    }

    @objc func rightArrowTapped() {
        let currentOffset = collectionView.contentOffset
        let maxOffsetX = collectionView.contentSize.width - collectionView.frame.width
        let newOffset = CGPoint(x: min(currentOffset.x + layout.itemSize.width, maxOffsetX), y: currentOffset.y)
        collectionView.setContentOffset(newOffset, animated: true)
    }
    @objc func openSettings() {
        let vc = SettingsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    private let games: [GameModel] = [
        GameModel(type: .guessPerson, image: UIImage(named: "man"), name: "Guess Person"),
        GameModel(type: .guessYear, image: UIImage(named: "build2"), name: "Guess Year"),
        GameModel(type: .quiz, image: UIImage(named: "rusalkaVector"), name: "Coming Soon!"),
    ]
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == articlesCollection {
            let articleVc = PeopleOverviewViewController(model: dataStr.wonderPeopleList[indexPath.row])
            articleVc.modalPresentationStyle = .fullScreen
            self.present(articleVc, animated: true)
        }
        else if collectionView == CityHistoryCollection {
            let cityHistVc = CityHistoryOverviewViewController(model: dataStr.cityHistoryList[indexPath.row])
            cityHistVc.modalPresentationStyle = .fullScreen
            self.present(cityHistVc, animated: true)
        }
        else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == articlesCollection {
            return 5
        }
        else if collectionView == CityHistoryCollection {
            return 5
        }
        else {
            return games.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == articlesCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! PeopleCollectionViewCell
            cell.configure(model: dataStr.wonderPeopleList[indexPath.row])
            return cell
        }
        else if collectionView == CityHistoryCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! PeopleCollectionViewCell
            cell.configure(model: dataStr.cityHistoryList[indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
            cell.configure(games[indexPath.item])
            cell.seeAllButtonAction = {
                if indexPath.item < 3 {
                    let vc = LevelsViewController(gameType: self.games[indexPath.row].type)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            return cell
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if collectionView == articlesCollection {
            
        }
        else if collectionView == CityHistoryCollection {
            
        }
        else {
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
            
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            let offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            
            targetContentOffset.pointee.x = roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView == articlesCollection {
            
        }
        else if collectionView == CityHistoryCollection {
            
        }
        else {
            let pageWidth = collectionView.frame.width
            let currentPage = Int((collectionView.contentOffset.x + pageWidth / 2) / pageWidth)
            pageControlView.setCurrentPage(currentPage)
        }
    }
}
struct GameModel {
    let type: GameType
    let image: UIImage?
    let name: String
}
enum GameType {
    case guessPerson
    case guessYear
    case quiz
}
