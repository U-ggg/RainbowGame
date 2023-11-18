//
//  DataStore.swift
//  RainbowGame
//
//  Created by Сазонов Станислав on 15.11.2023.
//

final class SettingsManager {
    static let shared = SettingsManager()
    
    private init() {}
    
    var timeNumber: Int = 60
    var speedNumber: Int = 4
    var sizeOfText: Int = 10
    var backgroundColor: Int = 0
    var ifRandomLocation: Bool = true
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
