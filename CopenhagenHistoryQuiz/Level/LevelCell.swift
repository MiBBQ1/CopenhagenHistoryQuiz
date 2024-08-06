import UIKit

final class LevelCell: UICollectionViewCell {
    
    private let levelLabel = UILabel()
    private let starsLabel = UILabel()
    private let lockImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        layer.cornerRadius = 15
        levelLabel.textColor = .white
        levelLabel.font = .InikaBold(ofSize: 20)
        
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        lockImageView.image = UIImage(named: "lock")
        lockImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(levelLabel)
        contentView.addSubview(starsLabel)
        contentView.addSubview(lockImageView)
        
        NSLayoutConstraint.activate([
            levelLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            levelLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            starsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            starsLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 8),
            
            lockImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lockImageView.widthAnchor.constraint(equalToConstant: 30),
            lockImageView.heightAnchor.constraint(equalToConstant: 30),
            lockImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(level: Int, isOpen: Bool, stars: Int) {
        levelLabel.text = "Level \(level)"
        lockImageView.isHidden = isOpen
        starsLabel.isHidden = !isOpen
        
        if isOpen {
            starsLabel.text = String(repeating: "⭐️", count: stars)
        }
    }
}

