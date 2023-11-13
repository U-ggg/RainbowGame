//
//  ColorSelection.swift
//  RainbowGame
//
//  Created by Vanopr on 13.11.2023.
//

import Foundation
import UIKit

struct ColorSelection {
    
    func gameColorSelection(gameColors: [(String, UIColor)]) -> [(String, UIColor)] {
        var randomColor: [(String, UIColor)] = []
        
        for _ in 1...6 {
            var colors = gameColors
            let randomNumber = Int.random(in: 0...colors.count - 1 )
            let colorNameSelected = colors.remove(at: randomNumber)
            let randomColorSelected = Int.random(in: 0...colors.count - 1)
            let uicolor = colors.remove(at: randomColorSelected)
            randomColor += [(colorNameSelected.0, uicolor.1)]
        }
        return randomColor
    }
    
}
