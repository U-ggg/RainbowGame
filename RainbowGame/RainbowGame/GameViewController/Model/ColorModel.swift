//
//  ColorModel.swift
//  RainbowGame
//
//  Created by Vanopr on 13.11.2023.
//

import Foundation
import UIKit


struct ColorModel {
    
    static let gameColorsModel: [(String, UIColor)] = [
        ("Красный", UIColor.red),
        ("Синий", UIColor.blue),
        ("Голубой", UIColor.lightBlue),
        ("Желтый", UIColor.systemYellow),
        ("Фиолетовый", UIColor.purple),
        ("Синий", UIColor.blue),
        ("Оранжевый", UIColor.orange),
        ("Красный", UIColor.red),
        ("Желтый", UIColor.systemYellow),
        ("Черный", UIColor.black),
        ("Серый", UIColor.gray)
    ]
    
    static var gameColors = gameColorsModel
}
