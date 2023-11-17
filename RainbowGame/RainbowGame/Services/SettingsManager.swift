//
//  DataStore.swift
//  RainbowGame
//
//  Created by Сазонов Станислав on 15.11.2023.
//

final class SettingsManager {
    static let shared = SettingsManager()
    
    private init() {}
    
    var resutlsModel = [ResutlsModel(time: 15, speed: 2, answer: 5), ResutlsModel(time: 25, speed: 1, answer: 7)]
    
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
    
    //MARK: - SaveResultModel
    func saveResult(time: Int, speed: Int, answer: Int) {
        resutlsModel.append(ResutlsModel(time: time, speed: speed, answer: answer))
    }
}
