//
//  Background.swift
//  RainbowGame
//
//  Created by Vanopr on 13.11.2023.
//

import UIKit

class Background: UIView {

    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
