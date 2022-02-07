//
//  EmotionCard.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 7.11.21.
//

import UIKit

struct EmotionCard {
    var number: Int
    var position: Int
    var name: String
    var abbrevation: String
    var color: UIColor
    
    init(number: Int, position: Int, name: String, abbrevation: String, color: UIColor) {
        self.number = number
        self.position = position
        self.name = name
        self.abbrevation = abbrevation
        self.color = color
    }
}
