//
//  ResultsViewController.swift
//  RainbowGame
//
//  Created by sidzhe on 12.11.2023.
//

import UIKit
import SnapKit

class ResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let cellIdentifier = "ResultCell"
    private var cellCount = 5 // Начальное количество ячеек

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ResultCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return collectionView
    }()

    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить статистику", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        addNewCells()
    }

    private func setupUI() {
        view.backgroundColor = .lightGray
        title = "Статистика"

        //        Использование системной стрелки
        //        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton

        view.addSubview(clearButton)
        clearButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(310)
            make.bottom.equalTo(clearButton.snp.top).offset(-10)
        }
    }

    private func addNewCells() {
        cellCount += 1
        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }

        cell.gameNumberLabel.text = "Игра № \(indexPath.item + 1)"
        cell.gameTimeLabel.text = "Время игры: \(indexPath.item + 1) мин"
        cell.gameSpeedLabel.text = "Скорость \(indexPath.item + 1)"
        cell.gameResultLabel.text = "Угадано \(indexPath.item + 1)"

        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 65)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    // MARK: - Button Actions

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func clearButtonTapped() {
        cellCount = 0
        collectionView.reloadData()
    }
}

class ResultCell: UICollectionViewCell {

    let gameNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.textAlignment = .left
        return label
    }()

    let gameTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let gameSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let gameResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = .green
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionCell() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2

        addSubview(gameNumberLabel)
        addSubview(gameTimeLabel)
        addSubview(gameSpeedLabel)
        addSubview(gameResultLabel)

        gameNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }

        gameTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(gameNumberLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        gameSpeedLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        gameResultLabel.snp.makeConstraints { make in
            make.top.equalTo(gameSpeedLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
