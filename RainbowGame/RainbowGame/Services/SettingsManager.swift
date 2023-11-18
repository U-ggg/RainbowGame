//
//  DataStore.swift
//  RainbowGame
//
//  Created by Сазонов Станислав on 15.11.2023.
//

import UIKit

enum CheckBox: Int {
  case green 
  case systemGreen
  case pink
  case cyan
  case brown
  case purple
  case blue
  case orange
  case red
  case yellow
  case black
  case gray
}

final class SettingsManager {
    
    static let shared = SettingsManager()
    
    private init() {}
    
    var timeNumber: Int = 1
    var speedNumber: Int = 1
    
    var substrateSwitchStatus: Bool = false
    var gameCheckSwitchStatus: Bool = false
    
    var textAlignment: NSTextAlignment = .center
    var changeBackgroundColor: UIColor = .white
    var wordSize: CGFloat = 15
    var wordColor: UIColor = .black
    
    func updateTimeNumber(value: Int) {
        timeNumber = value
    }
    
    func updateSpeedNumber(value: Int) {
        speedNumber = value
    }
    
    func convertMinutesToSeconds(minutes: Int) -> Int {
        let seconds = minutes * 60
        return seconds
    }
    
    func updateBackgroundColor(color: UIColor) {
        changeBackgroundColor = color
    }
    
    func updateWordSize(size: CGFloat) {
        wordSize = size
    }
    
    func updateBackgroundColor(backgroundColor: UIColor) {
        changeBackgroundColor = backgroundColor
    }
    
    func updateTextColor(button: UIButton) {
         guard let checkBox = CheckBox(rawValue: button.tag) else { return }
         switch checkBox {
         case .green:
             wordColor = .green
         case .systemGreen:
             wordColor = .systemGreen
         case .pink:
             wordColor = .systemPink
         case .cyan:
             wordColor = .cyan
         case .brown:
             wordColor = .brown
         case .purple:
             wordColor = .purple
         case .blue:
             wordColor = .blue
         case .orange:
             wordColor = .orange
         case .red:
             wordColor = .red
         case .yellow:
             wordColor = .yellow
         case .black:
             wordColor = .black
         case .gray:
             wordColor = .gray
         }
     }
    
    func updateTextAlignment(alignment: NSTextAlignment) {
           textAlignment = alignment
       }

}
