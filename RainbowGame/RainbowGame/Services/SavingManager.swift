//
//  SavedToUserDefault.swift
//  RainbowGame
//
//  Created by Vanopr on 17.11.2023.
//

import Foundation

//MARK: - SettingKey
enum SettingKey: String {
    case firstLaunch
    case timeNumber
    case speedNumber
    case substrateSwitchStatus
    case gameCheckSwitchStatus
    case ifContinueGame
    case timeLeft
    case resultsModel
}

//MARK: - SavingManager
struct SavingManager {
    
    //MARK: - Properties
    static let userDefaults = UserDefaults.standard
    static let settingManager = SettingsManager.shared
    
    //MARK: - Methods
    static func saveInitialValues() {
        if !getValueOfBool(forKey: .firstLaunch) {
            saveValue(value: 60, forKey: .timeNumber)
            saveValue(value: 3, forKey: .speedNumber)
            saveValue(value: false, forKey: .substrateSwitchStatus)
            saveValue(value: true, forKey: .gameCheckSwitchStatus)
            saveValue(value: false, forKey: .ifContinueGame)
            saveValue(value: true, forKey: .firstLaunch)
          }
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
    
    static func saveResultsModel() {
        do {
              let encoder = JSONEncoder()
            let encodedData = try encoder.encode(ResultsManager.shared.resutlsModel)
            userDefaults.set(encodedData, forKey: SettingKey.resultsModel.rawValue)
            print("Модель сохранена")
          } catch {
              print("Не удалось сохранить модель")
          }
    }
    
    static func loadResultsModel() {
        if let savedData = userDefaults.data(forKey: SettingKey.resultsModel.rawValue) {
             do {
                 let decoder = JSONDecoder()
                 let loadedModel = try decoder.decode([ResutlsModel].self, from: savedData)
                 ResultsManager.shared.resutlsModel = loadedModel
             } catch {
                 print("Не удалось загрузить модель")
                 ResultsManager.shared.resutlsModel = []
             }
         }
    }
}
