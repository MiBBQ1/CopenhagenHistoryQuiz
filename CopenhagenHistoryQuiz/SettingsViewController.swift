import UIKit
import StoreKit

final class SettingsViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Settings"
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
    
    // Switches and titles for settings
    private let vibroTitleLabel = SettingsViewController.createSettingTitleLabel(text: "Vibration")
    lazy var vibroSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = CopenDa.isVibro
        switchControl.onTintColor = .color(0x207C4C)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(vibroSwitchChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    private let musicTitleLabel = SettingsViewController.createSettingTitleLabel(text: "Music")
    lazy var musicSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = CopenDa.isMusic
        switchControl.onTintColor = .color(0x207C4C)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(musicSwitchChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    private let soundTitleLabel = SettingsViewController.createSettingTitleLabel(text: "Sound")
    lazy var soundSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = CopenDa.isSound
        switchControl.onTintColor = .color(0x207C4C)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(soundSwitchChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    // Buttons
    private let resetProgressButton = SettingsViewController.createButton(title: "Reset Progress")
    private let rateUsButton = SettingsViewController.createButton(title: "Rate Us")
    private let nextSongButton = SettingsViewController.createButton(title: "Next Song")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackImage()
        
        resetProgressButton.addTarget(self, action: #selector(resetProgress), for: .touchUpInside)
        rateUsButton.addTarget(self, action: #selector(rateUs), for: .touchUpInside)
        nextSongButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        
        view.addSubview(dismissButton)
        view.addSubview(titleLabel)
        view.addSubview(vibroTitleLabel)
        view.addSubview(vibroSwitch)
        view.addSubview(musicTitleLabel)
        view.addSubview(musicSwitch)
        view.addSubview(soundTitleLabel)
        view.addSubview(soundSwitch)
        view.addSubview(resetProgressButton)
        view.addSubview(rateUsButton)
        view.addSubview(nextSongButton)
        
        // Add lines
        let vibroLine = createLineView()
        let musicLine = createLineView()
        let soundLine = createLineView()
        
        view.addSubview(vibroLine)
        view.addSubview(musicLine)
        view.addSubview(soundLine)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            dismissButton.widthAnchor.constraint(equalToConstant: 50),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            // Vibration setting
            vibroTitleLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 20),
            vibroTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            vibroSwitch.centerYAnchor.constraint(equalTo: vibroTitleLabel.centerYAnchor),
            vibroSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            vibroLine.topAnchor.constraint(equalTo: vibroTitleLabel.bottomAnchor, constant: 10),
            vibroLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            vibroLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            vibroLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Music setting
            musicTitleLabel.topAnchor.constraint(equalTo: vibroLine.bottomAnchor, constant: 20),
            musicTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            musicSwitch.centerYAnchor.constraint(equalTo: musicTitleLabel.centerYAnchor),
            musicSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            musicLine.topAnchor.constraint(equalTo: musicTitleLabel.bottomAnchor, constant: 10),
            musicLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            musicLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            musicLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Sound setting
            soundTitleLabel.topAnchor.constraint(equalTo: musicLine.bottomAnchor, constant: 20),
            soundTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            soundSwitch.centerYAnchor.constraint(equalTo: soundTitleLabel.centerYAnchor),
            soundSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            soundLine.topAnchor.constraint(equalTo: soundTitleLabel.bottomAnchor, constant: 10),
            soundLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            soundLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            soundLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Buttons
            resetProgressButton.topAnchor.constraint(equalTo: soundLine.bottomAnchor, constant: 30),
            resetProgressButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            resetProgressButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            resetProgressButton.heightAnchor.constraint(equalToConstant: 50),
            
            rateUsButton.topAnchor.constraint(equalTo: resetProgressButton.bottomAnchor, constant: 20),
            rateUsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            rateUsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            rateUsButton.heightAnchor.constraint(equalToConstant: 50),
            
            nextSongButton.topAnchor.constraint(equalTo: rateUsButton.bottomAnchor, constant: 20),
            nextSongButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nextSongButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nextSongButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func nextSong() {
        Player.shared.playRandomLp()
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func vibroSwitchChanged(_ sender: UISwitch) {
        CopenDa.isVibro = sender.isOn
    }
    
    @objc func musicSwitchChanged(_ sender: UISwitch) {
        CopenDa.isMusic = sender.isOn
        Player.shared.checkState()
    }
    
    @objc func soundSwitchChanged(_ sender: UISwitch) {
        CopenDa.isSound = sender.isOn
    }
    @objc func resetProgress() {
        CopenDa.restartData()
    }
    @objc func rateUs() {
        SKStoreReviewController.requestReview()
    }
    private static func createSettingTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .InikaBold(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private static func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .color(0x207C4C).withAlphaComponent(0.6)
        button.titleLabel?.font = .InikaBold(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func createLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = .color(0xFFD700)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }
}
