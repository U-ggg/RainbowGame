//
//  SavedToUserDefault.swift
//  RainbowGame
//
//  Created by Vanopr on 17.11.2023.
//

import Foundation
enum SettingKey: String {
    case timeNumber
    case speedNumber
    case substrateSwitchStatus
    case gameCheckSwitchStatus
    case ifContinueGame
    case timeLeft
}

struct SavingManager {
    static let userDefaults = UserDefaults.standard
    static let settingManager = SettingsManager.shared
    
    static func saveInitialValues() {
        saveValue(value: 60, forKey: .timeNumber)
        saveValue(value: 3, forKey: .speedNumber)
        saveValue(value: false, forKey: .substrateSwitchStatus)
        saveValue(value: false, forKey: .gameCheckSwitchStatus)
        saveValue(value: false, forKey: .ifContinueGame)
    }
    
    static func saveSettings() {
        saveValue(value: settingManager.timeNumber, forKey: .timeNumber)
        saveValue(value: settingManager.speedNumber, forKey: .speedNumber)
        saveValue(value: settingManager.substrateSwitchStatus, forKey: .substrateSwitchStatus)
        saveValue(value: settingManager.gameCheckSwitchStatus, forKey: .gameCheckSwitchStatus)
    }
    
    static func saveValue<T>(value: T, forKey key: SettingKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    static func getValueOfInt(forKey key: SettingKey) -> Int {
        userDefaults.integer(forKey: key.rawValue)
    }
    
    static func getValueOfBool(forKey key: SettingKey) -> Bool {
        userDefaults.bool(forKey: key.rawValue)
    }
}
