//
//  GameViewController.swift
//  RainbowGame
//
//  Created by sidzhe on 12.11.2023.
//

import UIKit
import SnapKit

final class GameViewController: UIViewController {
    let background = Background()
    var cardViews: [RainbowCardView] = []
    let colorSelection = ColorSelection()
    var timer: Timer?
    var secondsPassed: Int = 0
    var isTimerPaused: Bool = false
    let gameTime = 120
    let updateTime = 20
    var updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextCards) , for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackGround()
        setupNavBar()
        setupCards()
        setupButton()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    private func setupCards() {
        let colors = colorSelection.gameColorSelection(gameColors: ColorModel.gameColors)
        var top = 120
        for i in 0...colors.count - 1 {
            let leading = Int.random(in: 20...150)
            let card = RainbowCardView(cardBackgroundColor: colors[i].1 , labelText: colors[i].0)
            card.delegate = self
            view.addSubview(card)
            card.snp.makeConstraints { make in
                make.top.equalTo(top)
                make.leading.equalTo(leading)
                make.height.equalTo(44)
                make.width.equalTo(200)
            }
            top += (Int(view.frame.height) - 120) / 7
            cardViews.append(card)
        }
    }
    
    
    private func setupBackGround() {
        view.backgroundColor = .white
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavBar() {
        title = "00:00"
        let customLeftButton = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward.fill"), style: .plain, target: self, action: #selector(backButtonTapped))
        let customRightButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonTapped))
        navigationItem.leftBarButtonItem = customLeftButton
        navigationItem.rightBarButtonItem = customRightButton
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
        ]
    }
    
    private func setupButton() {
        view.addSubview(updateButton)
        updateButton.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width - 80)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    private func formatTime(seconds: Int) -> String {
        // Функция для форматирования времени в формат "00:00"
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @objc func nextCards() {
        cardViews.forEach { $0.removeFromSuperview() }
        setupCards()
    }
    
    @objc func backButtonTapped() {
        
    }
    
    @objc func pauseButtonTapped() {
        isTimerPaused.toggle()
    }
    
    @objc func updateTimer() {
        guard !isTimerPaused else {
            updateButton.isEnabled = false
            return
        }
        updateButton.isEnabled = true
        secondsPassed += 1
        title = formatTime(seconds: secondsPassed)
        if secondsPassed == gameTime {
            timer?.invalidate()
            present(ResultsViewController(), animated: true)
        } else if secondsPassed % updateTime == 0 {
            cardViews.forEach { $0.removeFromSuperview() }
            setupCards()
        }
    }
}


extension GameViewController: CheckViewDelegate {
    func button() {
        print("kfkfkf")
    }
    
    
}
//
//#Preview {
//    GameViewController()
//}
