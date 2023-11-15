//
//  DataStore.swift
//  RainbowGame
//
//  Created by Сазонов Станислав on 15.11.2023.
//

final class SettingsManager {
   static let shared = SettingsManager()
   
   private init() {}
   
   var timeNumber: Float = 0.0
   var speedNumber: Float = 0.0
   
   func updateTimeNumber(value: Float) {
       timeNumber = value
   }
   
   func updateSpeedNumber(value: Float) {
       speedNumber = value
   }
    
}
