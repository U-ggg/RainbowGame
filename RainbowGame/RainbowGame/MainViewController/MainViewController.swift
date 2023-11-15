//
//  MainViewController.swift
//  RainbowGame
//
//  Created by sidzhe on 12.11.2023.
//

import SnapKit
import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
                
    }
    
    @objc func  buttonNewGamePressed() {
        let newGameVC = GameViewController()
        newGameVC.modalPresentationStyle =  .fullScreen
        self.present(newGameVC, animated: true)
    }

    
    @objc func  buttonContinuePressed() {
        let continueGameVC = GameViewController()
        continueGameVC.modalPresentationStyle =  .fullScreen
        self.present(continueGameVC, animated: true)
    }
    
    @objc func  buttonStatisticsPressed() {
        let statisticsVC = ResultsViewController()
        statisticsVC.modalPresentationStyle =  .fullScreen
        self.present(statisticsVC, animated: true)
    }
    
    @objc func  buttonSettingsPressed() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle =  .fullScreen
        self.present(settingsVC, animated: true)
    }

    @objc func  buttonRulesPressed() {
        let rulesVC = RulesViewController()
        rulesVC.modalPresentationStyle =  .fullScreen
        self.present(rulesVC, animated: true)
    }

    
    
    private func initialize() {
        view.backgroundColor = UIColor.gray
        
        let rainbowImage: UIImageView = {
            
           let image = UIImageView()
            image.image = UIImage(named: "rainbow")
            image.contentMode = .scaleAspectFit
//            image.backgroundColor = .red
            return image
        }()
        
        view.addSubview(rainbowImage)
        rainbowImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(200)
        }
        
        let rainbowLabel: UILabel = {
            let label = UILabel()
            label.text = "Игра Радуга"
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 40)
            label.textColor = .black
            label.numberOfLines = 0
//            label.backgroundColor = .red
            return label
        }()
        
        view.addSubview(rainbowLabel)
        rainbowLabel.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.top.equalTo(rainbowImage.snp.bottom).offset(5)
            make.height.equalTo(100)
        }
        
        
        let newGameButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.setTitle("Новая игра", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 25)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .red
            button.addTarget(nil, action: #selector(MainViewController.buttonNewGamePressed), for: .touchUpInside)

            return button
        }()
        
        view.addSubview(newGameButton)
        newGameButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(rainbowLabel.snp.bottom).offset(30)
            make.height.equalTo(56)
        }

        
        let continueGameButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.setTitle("Продолжить", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 25)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .blue
            button.addTarget(nil, action: #selector(MainViewController.buttonContinuePressed), for: .touchUpInside)

            return button
        }()
        
        view.addSubview(continueGameButton)
       continueGameButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(newGameButton.snp.bottom).offset(20)
            make.height.equalTo(56)
        }
        
        let statisticsButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.setTitle("Статистика", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 25)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .green
            button.addTarget(nil, action: #selector(MainViewController.buttonStatisticsPressed), for: .touchUpInside)

            return button
        }()
        
        view.addSubview(statisticsButton)
        statisticsButton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(continueGameButton.snp.bottom).offset(20)
            make.height.equalTo(56)
        }
        
        let settingsButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage (named: "settings"), for: .normal)

            button.addTarget(nil, action: #selector(MainViewController.buttonSettingsPressed), for: .touchUpInside)

            return button
        }()

        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints {make in
            make.left.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(50)
            make.width.height.equalTo(75)
        }
        
        let rulesButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage (named: "question"), for: .normal)

            button.addTarget(nil, action: #selector(MainViewController.buttonRulesPressed), for: .touchUpInside)

            return button
        }()

        view.addSubview(rulesButton)
        rulesButton.snp.makeConstraints {make in
            make.right.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(50)
            make.width.height.equalTo(75)
        }
        
    }
}
