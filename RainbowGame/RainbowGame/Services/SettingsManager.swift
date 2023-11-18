//
//  DataStore.swift
//  RainbowGame
//
//  Created by Сазонов Станислав on 15.11.2023.
//

final class SettingsManager {
    static let shared = SettingsManager()
    
    private init() {}
    
    var timeNumber: Int = 1
    var speedNumber: Int = 1
    
    var substrateSwitchStatus: Bool = false
    var gameCheckSwitchStatus: Bool = false
    
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

}
