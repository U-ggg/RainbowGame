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


    
    private func initialize() {
        view.backgroundColor = UIColor.purple
        
        let rainbowImage: UIImageView = {
            
           let image = UIImageView()
            image.image = UIImage(named: "rainbow")
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .red
            return image
        }()
        
        view.addSubview(rainbowImage)
        rainbowImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
            make.height.equalToSuperview().inset(300)
            
        }
        let newGameButton: UIButton = {
            let button = UIButton()
            button.setTitle("Новая игра", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 25)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .green
//            button.setBackgroundImage(UIImage(systemName: "green"), for: .normal)
            button.addTarget(nil, action: #selector(MainViewController.buttonNewGamePressed), for: .touchUpInside)

            return button
        }()
        view.addSubview(newGameButton)
        newGameButton.snp.makeConstraints {make in
            make.left.right.equalToSuperview().inset(100)
            make.top.equalTo(rainbowImage.snp.bottom).offset(20)
            make.height.equalToSuperview().inset(200)
        }

    }
}
