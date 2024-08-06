import UIKit

final class CityHistoryMoreViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "City History"
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
    
    private let guidesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackImage()
        guidesTableView.register(CityHistoryTableViewCell.self, forCellReuseIdentifier: "CityHistoryTableViewCell")
        guidesTableView.delegate = self
        guidesTableView.dataSource = self
        guidesTableView.translatesAutoresizingMaskIntoConstraints = false
        guidesTableView.backgroundColor = .clear
        guidesTableView.separatorColor = .clear
        guidesTableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        
        self.view.addSubview(guidesTableView)
        self.view.addSubview(dismissButton)
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            dismissButton.widthAnchor.constraint(equalToConstant: 50),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            guidesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            guidesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            guidesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            guidesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            titleLabel.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
        ])
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension CityHistoryMoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStr.cityHistoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityHistoryTableViewCell", for: indexPath) as? CityHistoryTableViewCell else {
            return UITableViewCell()
        }
        cell.configureWith(model: dataStr.cityHistoryList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityHistVc = CityHistoryOverviewViewController(model: dataStr.cityHistoryList[indexPath.row])
        cityHistVc.modalPresentationStyle = .fullScreen
        self.present(cityHistVc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}
