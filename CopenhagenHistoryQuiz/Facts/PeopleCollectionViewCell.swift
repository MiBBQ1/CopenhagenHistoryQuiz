import UIKit

final class PeopleCollectionViewCell: UICollectionViewCell {
    private let profileImageView = UIImageView()
    private let mainView = UIView()
    private let titleText = UILabel()
    private let descriptionText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .clear
        
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 22
        profileImageView.contentMode = .scaleAspectFill
        
        titleText.font = UIFont.InikaBold(ofSize: 18)
        titleText.textColor = .white
        titleText.numberOfLines = 2
        titleText.textAlignment = .left
        
        descriptionText.font = UIFont.InikaRegular(ofSize: 15)
        descriptionText.textColor = .white
        descriptionText.numberOfLines = 4 
        descriptionText.textAlignment = .left
        
        mainView.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        mainView.layer.cornerRadius = 22
        
        [mainView, titleText, descriptionText, profileImageView].forEach { uiview in
            addSubview(uiview)
            uiview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 68),
            profileImageView.heightAnchor.constraint(equalToConstant: 68),
            
            titleText.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10),
            titleText.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleText.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 5),
            descriptionText.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10),
            descriptionText.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            //descriptionText.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
        ])
    }
    
    public func configure(model: CityHistory) {
        titleText.text = model.eventName
        descriptionText.text = model.mainFact
        profileImageView.image = model.image
    }
    public func configure(model: WonderPeople) {
        titleText.text = model.name
        descriptionText.text = model.mainFact
        profileImageView.image = model.image
    }
}
