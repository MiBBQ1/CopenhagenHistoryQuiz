import UIKit

final class CityHistoryOverviewViewController: UIViewController {
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
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let scrollView = UIScrollView()
    
    private let imageView = UIImageView()
    
    private let imageHeight = 172.0
    var imageViewTopAnchor: NSLayoutConstraint!
    var imageViewHeightAnchor: NSLayoutConstraint!
    
    init(model: CityHistory) {
        self.imageView.image = model.image
        self.titleLabel.text = model.eventName
        self.descriptionLabel.attributedText = dataStr.shared.createDatacityHistoryDetails()[model.eventName]

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackImage()
        
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 1
        titleLabel.font = .InikaBold(ofSize: 22)
        
        descriptionLabel.numberOfLines = 0
        
        scrollView.delegate = self
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
            
        [scrollView, dismissButton].forEach { uiview in
            view.addSubview(uiview)
            uiview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [titleLabel, descriptionLabel, imageView].forEach { uiview in
            scrollView.addSubview(uiview)
            uiview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dismissButton.widthAnchor.constraint(equalToConstant: 50),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60)
        imageViewHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        
        imageViewTopAnchor.isActive = true
        imageViewHeightAnchor.isActive = true
        
        scrollView.verticalScrollIndicatorInsets.top = imageViewHeightAnchor.constant
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension CityHistoryOverviewViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffY = scrollView.contentOffset.y
        
        if contentOffY < 0 {
            imageViewTopAnchor.constant = contentOffY
            imageViewHeightAnchor.constant = imageHeight - contentOffY
        }
        scrollView.verticalScrollIndicatorInsets.top = imageViewHeightAnchor.constant - view.safeAreaInsets.top
    }
}
