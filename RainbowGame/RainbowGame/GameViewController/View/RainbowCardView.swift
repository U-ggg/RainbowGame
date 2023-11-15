//
//  RainbowCardView.swift
//  RainbowGame
//
//  Created by Vanopr on 13.11.2023.
//

import UIKit
import SnapKit

protocol CheckViewDelegate: AnyObject {
    func button()
}

class RainbowCardView: UIView {
    private var cardBackgroundColor: UIColor?
    private var labelText: String?
    private var ifCardBackgroundOn  = true
    private var ifCheckButtonOn = true
    weak var delegate: CheckViewDelegate?
    private var fontSize = 15
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.isUserInteractionEnabled = true
        return button
    }()
    
    init(cardBackgroundColor: UIColor? = nil, labelText: String? = nil) {
        self.cardBackgroundColor = cardBackgroundColor
        self.labelText = labelText
        super.init(frame: CGRect.zero)
        setupView()
        setupCheckButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 15
        
        if ifCardBackgroundOn {
            backgroundColor = cardBackgroundColor
            label.textColor = .white
        } else {
            label.textColor = cardBackgroundColor
        }
        setupLabel()
    }
    
    private func setupLabel() {
        label.text = labelText
        label.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
//        if ifCheckButtonOn {
//            label.snp.makeConstraints { make in
//                make.centerY.equalToSuperview()
//                make.leading.equalToSuperview().inset(3)
//            }
//        } else {
//            label.snp.makeConstraints { make in
//                make.center.equalToSuperview()
//            }
//        }
    }
    
    private func setupCheckButton() {
        guard ifCheckButtonOn else {return}
        addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.snp.trailing).inset(5)
            make.height.equalTo(self.snp.height).inset(2)
            make.width.equalTo(self.snp.height).inset(2)
        }
        checkButton.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
    }
    
    @objc func didButtonTapped() {
        delegate?.button()
        if checkButton.isSelected {
            checkButton.isSelected = false
            checkButton.setImage(nil, for: .normal)
        } else {
            checkButton.isSelected = true
            checkButton.tintColor = .green
            imageSet(checkButton, with: "checkmark.circle.fill")
        }
        self.reloadInputViews()
    }
    
    func imageSet(_ button: UIButton, with imageName: String) {
        let iconConfiguration = UIImage.SymbolConfiguration(pointSize: 40, weight: .medium, scale: .medium)
        let image = UIImage(systemName: imageName, withConfiguration: iconConfiguration)
        button.setImage(image, for: .normal)
    }
}
