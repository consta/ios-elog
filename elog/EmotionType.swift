//
//  Emotion.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 16.02.22.
//

import Foundation
import UIKit

enum EmotionType : Int, CaseIterable {
    
    case void           = 0
    
    case horror         = 1
    case sorrow         = 2
    case aversion       = 3
    case alertness      = 4
    case shame          = 5
    case sadness        = 6
    
    case delight        = 7
    case boredom        = 8
    case embarrassment  = 9
    case confusion      = 10
    case serenity       = 11
    case nuisance       = 12
    case anxiety        = 13
    
    case displeasure    = 14
    case fear           = 15
    case anger          = 16
    case amazement      = 17
    case melancholy     = 18
    case guilt          = 19
    case rage           = 20
    
    case admiration     = 21
    case trust          = 22
    case anticipation   = 23
    case joy            = 24
    case suprise        = 25
    case interest       = 26
    case acceptance     = 27
    
    static func getByRawValue(rawValue: Int) -> EmotionType? {
        let e = self.allCases.filter { e in return e.rawValue == rawValue }.first
        return e
    }

    static func getByPosition(position: Int) -> EmotionType? {
        let e = self.allCases.filter { e in return e.attributes.position == position }.first
        return e
    }
    
    var attributes: (position: Int, name: String, abbrevation: String, color: UIColor) {
        let colorNone   =   #colorLiteral(red: 0.6913456321, green: 0.8488981128, blue: 1, alpha: 0)
        let colorBlue   =   #colorLiteral(red: 0.6690862775, green: 0.8058274388, blue: 0.9767666459, alpha: 1)
        let colorYellow =   #colorLiteral(red: 0.9572288394, green: 0.8463208079, blue: 0.6030815244, alpha: 1)
        let colorPink   =   #colorLiteral(red: 0.9527825713, green: 0.7045833468, blue: 0.7854396701, alpha: 1)
        
        switch self {
        case .void:
            return (-1, "", "", colorNone)
        case .horror:
            return (0, "Ужас", "U", colorBlue)
        case .sorrow:
            return (7, "Горе", "Go", colorBlue)
        case .aversion:
            return (8, "Отвращение", "Fu", colorBlue)
        case .alertness:
            return (9, "Настороженность", "Nr", colorBlue)
        case .shame:
            return (12, "Стыд", "Sd", colorYellow)
        case .sadness:
            return (13, "Печаль", "P", colorYellow)
        case .delight:
            return (14, "Восторг", "Vo", colorBlue)
        case .boredom:
            return (15, "Скука", "Sk", colorPink)
        case .embarrassment:
            return (16, "Смущение", "Sm", colorPink)
        case .confusion:
            return (17, "Растерянность", "Mm", colorPink)
        case .serenity:
            return (18, "Безмятежность", "Bm", colorPink)
        case .nuisance:
            return (19, "Досада", "D", colorPink)
        case .anxiety:
            return (20, "Тревога", "Tg", colorPink)
        case .displeasure:
            return (21, "Неудовольствие", "Nu", colorYellow)
        case .fear:
            return (22, "Страх", "St", colorYellow)
        case .anger:
            return (23, "Злость", "Z", colorYellow)
        case .amazement:
            return (24, "Изумление", "Iz", colorBlue)
        case .melancholy:
            return (25, "Грусть", "Gr", colorPink)
        case .guilt:
            return (26, "Вина", "Vn", colorBlue)
        case .rage:
            return (27, "Гнев", "Gn", colorBlue)
        case .admiration:
            return (28, "Восхищение", "Wow", colorBlue)
        case .trust:
            return (29, "Доверие", "Dv", colorYellow)
        case .anticipation:
            return (30, "Ожидание", "Od", colorYellow)
        case .joy:
            return (31, "Радость", "Ra", colorYellow)
        case .suprise:
            return (32, "Удивление", "Ogo", colorYellow)
        case .interest:
            return (33, "Интерес", "In", colorPink)
        case .acceptance:
            return (34, "Принятие", "Pn", colorPink)

        }
    }
}
