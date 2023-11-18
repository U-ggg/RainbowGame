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
        ("Зеленый", UIColor.green),
        ("Розовый", UIColor.systemPink),
        ("Голубой", UIColor.lightBlue),
        ("Коричневый", UIColor.brown),
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
