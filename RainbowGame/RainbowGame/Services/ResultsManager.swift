//
//  ResultsManager.swift
//  RainbowGame
//
//  Created by Vanopr on 17.11.2023.
//

import Foundation

final class ResultsManager {
    static let shared = ResultsManager()
    var resutlsModel: [ResutlsModel] = []
    
    //MARK: - SaveResultModel
    func saveResult(time: Int, speed: Int, answer: Int? = nil) {
        resutlsModel.append(ResutlsModel(time: time, speed: speed, answer: answer))
    }
}
