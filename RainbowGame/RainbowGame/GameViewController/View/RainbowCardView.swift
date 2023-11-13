//
//  RainbowCardView.swift
//  RainbowGame
//
//  Created by Vanopr on 13.11.2023.
//

import UIKit
import SnapKit

class RainbowCardView: UIView {
private var cardBackgroundColor: UIColor?
private var labelText: String?
private var ifBackgroundOn: Bool = true
    
    private let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()
    
    init(cardBackgroundColor: UIColor? = nil, labelText: String? = nil) {
        self.cardBackgroundColor = cardBackgroundColor
        self.labelText = labelText
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        label.text = labelText
        label.font = .systemFont(ofSize: 30)
        if ifBackgroundOn {
            backgroundColor = cardBackgroundColor
            label.textColor = .white
        } else {
            label.textColor = cardBackgroundColor
        }
        layer.cornerRadius = 15
        addSubview(label)
            label.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    
}
