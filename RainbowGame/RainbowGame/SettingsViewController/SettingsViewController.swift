//
//  SettingsViewController.swift
//  RainbowGame
//
//  Created by sidzhe on 12.11.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - UI
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let timeView = UIView(backgroundColor: .white)
    private let timeStackView = UIStackView(spacing: 10)
    private let timeSlider = UISlider(maximumValue: 22)
    private let timeTextLabel = UILabel(text: "время игры, мин", fontSize: 15)
    private let timeNumber = UILabel(text: "1", fontSize: 20)
    
    private let speedView = UIView(backgroundColor: .white)
    private let speedStackView = UIStackView(spacing: 10)
    private let speedLabel = UILabel(text: "скорость смены заданий, сек", fontSize: 15)
    private let speedSlider = UISlider(maximumValue: 4)
    private let speedNumber = UILabel(text: "1", fontSize: 20)
    
    private let substrateView = UIView(backgroundColor: .white)
    private let substrateStackView = UIStackView(spacing: 50)
    private let substrateLabel = UILabel(text: "подложка для букв", fontSize: 15)
    private lazy var switchSubstrate: UISwitch = {
        let element = UISwitch()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let gameCheckView = UIView(backgroundColor: .white)
    private let gameCheckStackView = UIStackView(spacing: 40)
    private let gameCheckLabel = UILabel(text: "игра с проверкой заданий", fontSize: 15)
    private lazy var gameCheckSwitch: UISwitch = {
        let element = UISwitch()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let wordColorView = UIView(backgroundColor: .white)
    private let wordColorStackView = UIStackView(spacing: 20)
    private let wordColorLabel = UILabel(text: "цвета букв", fontSize: 15)
    private let wordColorCheckBoxesStackView = UIStackView(spacing: 5)
    
    private let greenCheckBox = UIView(backgroundColor: .green)
    private let systemGreenCheckBox = UIView(backgroundColor: .systemGreen)
    private let pinkCheckBox = UIView(backgroundColor: .systemPink)
    private let cyanCheckBox = UIView(backgroundColor: .cyan)
    private let brownCheckBox = UIView(backgroundColor: .brown)
    private let purpleCheckBox = UIView(backgroundColor: .purple)
    
    private let greenVector = UIImageView(vectorIsHidden: false)
    private let systemGreenVector = UIImageView(vectorIsHidden: true)
    private let systemPinkVector = UIImageView(vectorIsHidden: true)
    private let cyanVector = UIImageView(vectorIsHidden: true)
    private let brownVector = UIImageView(vectorIsHidden: true)
    private let purpleVector = UIImageView(vectorIsHidden: true)
    
    
    
    
    // MARK: - Private Properties
    
    private let gameSettings = SettingsManager.shared
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
    }
    
    // MARK: - Set Views
    
    private func setViews() {
        let customLeftButton = UIBarButtonItem(
            image: UIImage(named: "backButton"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        customLeftButton.tintColor = .black
        navigationItem.leftBarButtonItem = customLeftButton
        
        view.backgroundColor = .lightGray
        
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(timeView)
        mainStackView.addArrangedSubview(speedView)
        mainStackView.addArrangedSubview(gameCheckView)
        mainStackView.addArrangedSubview(wordColorView)
        mainStackView.addArrangedSubview(substrateView)
        
        timeView.addSubview(timeStackView)
        speedView.addSubview(speedStackView)
        gameCheckView.addSubview(gameCheckStackView)
        wordColorView.addSubview(wordColorStackView)
        substrateView.addSubview(substrateStackView)
        
        timeStackView.addArrangedSubview(timeTextLabel)
        timeStackView.addArrangedSubview(timeSlider)
        timeStackView.addArrangedSubview(timeNumber)
        
        speedStackView.addArrangedSubview(speedLabel)
        speedStackView.addArrangedSubview(speedSlider)
        speedStackView.addArrangedSubview(speedNumber)
        
        gameCheckStackView.addArrangedSubview(gameCheckLabel)
        gameCheckStackView.addArrangedSubview(gameCheckSwitch)
        
        wordColorStackView.addArrangedSubview(wordColorLabel)
        wordColorStackView.addArrangedSubview(wordColorCheckBoxesStackView)
        
        wordColorCheckBoxesStackView.addArrangedSubview(greenCheckBox)
        wordColorCheckBoxesStackView.addArrangedSubview(systemGreenCheckBox)
        wordColorCheckBoxesStackView.addArrangedSubview(pinkCheckBox)
        wordColorCheckBoxesStackView.addArrangedSubview(cyanCheckBox)
        wordColorCheckBoxesStackView.addArrangedSubview(brownCheckBox)
        wordColorCheckBoxesStackView.addArrangedSubview(purpleCheckBox)
        
        greenCheckBox.addSubview(greenVector)
        systemGreenCheckBox.addSubview(systemGreenVector)
        pinkCheckBox.addSubview(systemPinkVector)
        cyanCheckBox.addSubview(cyanVector)
        brownCheckBox.addSubview(brownVector)
        purpleCheckBox.addSubview(purpleVector)
        
        
        
        substrateStackView.addArrangedSubview(substrateLabel)
        substrateStackView.addArrangedSubview(switchSubstrate)
        
        timeSlider.addTarget(self, action: #selector(timeSliderChanged), for: .valueChanged)
        speedSlider.addTarget(self, action: #selector(speedSliderChanged), for: .valueChanged)
        switchSubstrate.addTarget(self, action: #selector(substrateSwitchChanged), for: .valueChanged)
        gameCheckSwitch.addTarget(self, action: #selector(gameCheckChanged), for: .valueChanged)
        
    }
    
    // MARK: - Setup Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timeView.widthAnchor.constraint(equalToConstant: 300),
            timeView.heightAnchor.constraint(equalToConstant: 65),
            
            speedView.widthAnchor.constraint(equalToConstant: 300),
            speedView.heightAnchor.constraint(equalToConstant: 65),
            
            gameCheckView.widthAnchor.constraint(equalToConstant: 300),
            gameCheckView.heightAnchor.constraint(equalToConstant: 66),
            
            wordColorView.widthAnchor.constraint(equalToConstant: 300),
            wordColorView.heightAnchor.constraint(equalToConstant: 66),
            
            greenCheckBox.widthAnchor.constraint(equalToConstant: 25),
            greenCheckBox.heightAnchor.constraint(equalToConstant: 25),
            systemGreenCheckBox.widthAnchor.constraint(equalToConstant: 25),
            systemGreenCheckBox.heightAnchor.constraint(equalToConstant: 25),
            pinkCheckBox.widthAnchor.constraint(equalToConstant: 25),
            pinkCheckBox.heightAnchor.constraint(equalToConstant: 25),
            cyanCheckBox.widthAnchor.constraint(equalToConstant: 25),
            cyanCheckBox.heightAnchor.constraint(equalToConstant: 25),
            brownCheckBox.widthAnchor.constraint(equalToConstant: 25),
            brownCheckBox.heightAnchor.constraint(equalToConstant: 25),
            purpleCheckBox.widthAnchor.constraint(equalToConstant: 25),
            purpleCheckBox.heightAnchor.constraint(equalToConstant: 25),
            
            substrateView.widthAnchor.constraint(equalToConstant: 300),
            substrateView.heightAnchor.constraint(equalToConstant: 66),
            
            timeStackView.topAnchor.constraint(equalTo: timeView.safeAreaLayoutGuide.topAnchor),
            timeStackView.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: 10),
            timeStackView.trailingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: -10),
            timeStackView.bottomAnchor.constraint(equalTo: timeView.safeAreaLayoutGuide.bottomAnchor),
            
            timeNumber.widthAnchor.constraint(equalToConstant: 25),
            
            speedStackView.topAnchor.constraint(equalTo: speedView.safeAreaLayoutGuide.topAnchor),
            speedStackView.leadingAnchor.constraint(equalTo: speedView.leadingAnchor, constant: 10),
            speedStackView.trailingAnchor.constraint(equalTo: speedView.trailingAnchor, constant: -10),
            speedStackView.bottomAnchor.constraint(equalTo: speedView.safeAreaLayoutGuide.bottomAnchor),
            
            speedNumber.widthAnchor.constraint(equalToConstant: 25),
            
            gameCheckStackView.topAnchor.constraint(equalTo: gameCheckView.safeAreaLayoutGuide.topAnchor),
            gameCheckStackView.leadingAnchor.constraint(equalTo: gameCheckView.leadingAnchor, constant: 10),
            gameCheckStackView.trailingAnchor.constraint(equalTo: gameCheckView.trailingAnchor, constant: -10),
            gameCheckStackView.bottomAnchor.constraint(equalTo: gameCheckView.safeAreaLayoutGuide.bottomAnchor),
            
            wordColorStackView.topAnchor.constraint(equalTo: wordColorView.safeAreaLayoutGuide.topAnchor),
            wordColorStackView.leadingAnchor.constraint(equalTo: wordColorView.leadingAnchor, constant: 10),
            wordColorStackView.trailingAnchor.constraint(equalTo: wordColorView.trailingAnchor, constant: -10),
            wordColorStackView.bottomAnchor.constraint(equalTo: wordColorView.safeAreaLayoutGuide.bottomAnchor),
            
            substrateStackView.topAnchor.constraint(equalTo: substrateView.safeAreaLayoutGuide.topAnchor),
            substrateStackView.leadingAnchor.constraint(equalTo: substrateView.leadingAnchor, constant: 10),
            substrateStackView.trailingAnchor.constraint(equalTo: substrateView.trailingAnchor, constant: -10),
            substrateStackView.bottomAnchor.constraint(equalTo: substrateView.safeAreaLayoutGuide.bottomAnchor),
            
            greenVector.topAnchor.constraint(equalTo: greenCheckBox.safeAreaLayoutGuide.topAnchor),
            greenVector.leadingAnchor.constraint(equalTo: greenCheckBox.leadingAnchor),
            greenVector.trailingAnchor.constraint(equalTo: greenCheckBox.trailingAnchor),
            greenVector.bottomAnchor.constraint(equalTo: greenCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
            systemGreenVector.topAnchor.constraint(equalTo: systemGreenCheckBox.safeAreaLayoutGuide.topAnchor),
            systemGreenVector.leadingAnchor.constraint(equalTo: systemGreenCheckBox.leadingAnchor),
            systemGreenVector.trailingAnchor.constraint(equalTo: systemGreenCheckBox.trailingAnchor),
            systemGreenVector.bottomAnchor.constraint(equalTo: systemGreenCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
            systemPinkVector.topAnchor.constraint(equalTo: pinkCheckBox.safeAreaLayoutGuide.topAnchor),
            systemPinkVector.leadingAnchor.constraint(equalTo: pinkCheckBox.leadingAnchor),
            systemPinkVector.trailingAnchor.constraint(equalTo: pinkCheckBox.trailingAnchor),
            systemPinkVector.bottomAnchor.constraint(equalTo: pinkCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
            cyanVector.topAnchor.constraint(equalTo: cyanCheckBox.safeAreaLayoutGuide.topAnchor),
            cyanVector.leadingAnchor.constraint(equalTo: cyanCheckBox.leadingAnchor),
            cyanVector.trailingAnchor.constraint(equalTo: cyanCheckBox.trailingAnchor),
            cyanVector.bottomAnchor.constraint(equalTo: pinkCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
            brownVector.topAnchor.constraint(equalTo: brownCheckBox.safeAreaLayoutGuide.topAnchor),
            brownVector.leadingAnchor.constraint(equalTo: brownCheckBox.leadingAnchor),
            brownVector.trailingAnchor.constraint(equalTo: brownCheckBox.trailingAnchor),
            brownVector.bottomAnchor.constraint(equalTo: brownCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
            purpleVector.topAnchor.constraint(equalTo: purpleCheckBox.safeAreaLayoutGuide.topAnchor),
            purpleVector.leadingAnchor.constraint(equalTo: purpleCheckBox.leadingAnchor),
            purpleVector.trailingAnchor.constraint(equalTo: purpleCheckBox.trailingAnchor),
            purpleVector.bottomAnchor.constraint(equalTo: purpleCheckBox.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    // MARK: - Slider Actions
    
    @objc private func timeSliderChanged(_ sender: UISlider) {
        gameSettings.timeNumber = Int(sender.value)
        timeNumber.text = String(format: "%.f", sender.value)
    }
    
    @objc private func speedSliderChanged(_ sender: UISlider) {
        gameSettings.speedNumber = Int(sender.value)
        speedNumber.text = String(format: "%.f", sender.value)
    }
    
    //MARK: - Back Button
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Switch Actions
    
    @objc func substrateSwitchChanged(_ sender: UISwitch) {
        gameSettings.substrateSwitchStatus = sender.isOn ? true : false
    }
    
    @objc func gameCheckChanged(_ sender: UISwitch) {
        gameSettings.gameCheckSwitchStatus = sender.isOn ? true : false
    }
    
}

// MARK: - Extensions

extension UILabel {
    convenience init(text: String, fontSize: CGFloat) {
        self.init()
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.text = text
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(spacing: CGFloat) {
        self.init()
        self.axis = .horizontal
        self.alignment = .center
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UISlider {
    convenience init(maximumValue: Float) {
        self .init()
        self.minimumTrackTintColor = .orange
        self.maximumValue = maximumValue
        self.minimumValue = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.layer.cornerRadius = 10
        self.backgroundColor = backgroundColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(vectorIsHidden: Bool) {
        self.init()
        self.image = UIImage(named: "vector")
        self.isHidden = vectorIsHidden
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
