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
    private let timeNumber = UILabel(text: "0", fontSize: 20)
    
    private let speedView = UIView(backgroundColor: .white)
    private let speedStackView = UIStackView(spacing: 10)
    private let speedLabel = UILabel(text: "скорость смены заданий, сек", fontSize: 15)
    private let speedSlider = UISlider(maximumValue: 4)
    private let speedNumber = UILabel(text: "0", fontSize: 20)
    
    private let substrateView = UIView(backgroundColor: .white)
    private let substrateStackView = UIStackView(spacing: 50)
    private let substrateLabel = UILabel(text: "подложка для букв", fontSize: 15)
    private lazy var switchSubstrate: UISwitch = {
        let element = UISwitch()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
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
        
        let customLeftButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        customLeftButton.tintColor = .black
        navigationItem.leftBarButtonItem = customLeftButton
        
        view.backgroundColor = .lightGray
        
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(timeView)
        mainStackView.addArrangedSubview(speedView)
        mainStackView.addArrangedSubview(substrateView)
        
        timeView.addSubview(timeStackView)
        speedView.addSubview(speedStackView)
        substrateView.addSubview(substrateStackView)
        
        timeStackView.addArrangedSubview(timeTextLabel)
        timeStackView.addArrangedSubview(timeSlider)
        timeStackView.addArrangedSubview(timeNumber)
        
        speedStackView.addArrangedSubview(speedLabel)
        speedStackView.addArrangedSubview(speedSlider)
        speedStackView.addArrangedSubview(speedNumber)
        
        substrateStackView.addArrangedSubview(substrateLabel)
        substrateStackView.addArrangedSubview(switchSubstrate)
        
        timeSlider.addTarget(self, action: #selector(timeSliderChanged), for: .valueChanged)
        speedSlider.addTarget(self, action: #selector(speedSliderChanged), for: .valueChanged)
        
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
            
            substrateStackView.topAnchor.constraint(equalTo: substrateView.safeAreaLayoutGuide.topAnchor),
            substrateStackView.leadingAnchor.constraint(equalTo: substrateView.leadingAnchor, constant: 10),
            substrateStackView.trailingAnchor.constraint(equalTo: substrateView.trailingAnchor, constant: -10),
            substrateStackView.bottomAnchor.constraint(equalTo: substrateView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    // MARK: - Slider Actions
    
    @objc private func timeSliderChanged(_ sender: UISlider) {
        gameSettings.timeNumber = sender.value
        timeNumber.text = String(format: "%.f", sender.value)
    }
    
    @objc private func speedSliderChanged(_ sender: UISlider) {
        gameSettings.speedNumber = sender.value
        speedNumber.text = String(format: "%.f", sender.value)
    }
    
    //MARK: - Back Button
    
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
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
        self.minimumValue = 0
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

