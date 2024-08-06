import UIKit

final class PeopleTableViewCell: UITableViewCell {
    private let profileImageView = UIImageView()
    private let mainView = UIView()
    private let titleText = UILabel()
    private let descriptionText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
    }

    public func configureWith(model: WonderPeople) {
        titleText.text = model.name
        descriptionText.text = model.mainFact
        profileImageView.image = model.image
        
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 22
        profileImageView.contentMode = .scaleAspectFill
        
        mainView.layer.cornerRadius = 22
        mainView.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        
        titleText.font = UIFont.InikaBold(ofSize: 18)
        titleText.textColor = .white
        titleText.textAlignment = .left
        
        descriptionText.font = UIFont.InikaRegular(ofSize: 15)
        descriptionText.textColor = .white
        descriptionText.numberOfLines = 3
        descriptionText.textAlignment = .left
        
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

}
