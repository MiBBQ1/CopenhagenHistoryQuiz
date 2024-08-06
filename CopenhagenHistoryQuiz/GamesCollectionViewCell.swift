import UIKit

final class GamesCollectionViewCell: UICollectionViewCell {
    public var seeAllButtonAction: (() -> Void)?
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .InikaBold(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        return label
    }()
    
    public let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        //label.textColor = UIColor.secondText
        label.font = .InikaBold(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var backView: UIView = {
        let backGroundView = UIView()
        //backGroundView.backgroundColor = UIColor.secondBackground
        backGroundView.layer.cornerRadius = 15
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        return backGroundView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        button.titleLabel?.font = .InikaBold(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupStartButton()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStartButton() {
        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        contentView.addSubview(startButton)
    }
    
    private func setupViews() {
        contentView.addSubview(backView)
        backView.addSubview(cellImageView)
        backView.addSubview(titleLabel)
        backView.addSubview(subTitleLabel)
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            cellImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 25),
            cellImageView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 25),
            cellImageView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -25),
            cellImageView.heightAnchor.constraint(equalToConstant: 125),
            
            titleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: startButton.leftAnchor, constant: -10),
            
            subTitleLabel.bottomAnchor.constraint(equalTo: startButton.bottomAnchor),
            subTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            subTitleLabel.rightAnchor.constraint(equalTo: startButton.leftAnchor, constant: -10),
            
            startButton.heightAnchor.constraint(equalToConstant: 36),
            startButton.widthAnchor.constraint(equalToConstant: 104),
            startButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            startButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -5),
        ])
    }
    public func configure(_ model: GameModel) {
        titleLabel.text = model.name
        cellImageView.image = model.image
        if model.type == .quiz {
            startButton.isHidden = true
        }
    }
    @objc func startTapped() {
        seeAllButtonAction?()
    }
}
