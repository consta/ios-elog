//
//  ViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 6.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayCards: [UIButton]!
    
    @IBOutlet weak var emCardText: UITextView!
    var emotionCards = [
        0: EmotionCard(number:1, position: 0, name: "Ужас", abbrevation: "U", color: UIColor.systemBlue),
        
        7: EmotionCard(number:2, position: 7, name: "Горе", abbrevation: "Go", color: UIColor.systemBlue),
        8: EmotionCard(number:3, position: 8, name: "Отвращение", abbrevation: "Fu", color: UIColor.systemBlue),
        9: EmotionCard(number:4, position: 9, name: "Настороженность", abbrevation: "Nr", color: UIColor.systemBlue),
        12: EmotionCard(number:5, position: 12, name: "Стыд", abbrevation: "Sd", color: UIColor.systemYellow),
        13: EmotionCard(number:6, position: 13, name: "Печаль", abbrevation: "P", color: UIColor.systemYellow),
        
        14: EmotionCard(number:7, position: 14, name: "Восторг", abbrevation: "Vo", color: UIColor.systemBlue),
        15: EmotionCard(number:8, position: 15, name: "Скука", abbrevation: "Sk", color: UIColor.systemPink),
        16: EmotionCard(number:9, position: 16, name: "Смущение", abbrevation: "Sm", color: UIColor.systemPink),
        17: EmotionCard(number:10, position: 17, name: "Растерянность", abbrevation: "Mm", color: UIColor.systemPink),
        18: EmotionCard(number:11, position: 18, name: "Безмятежность", abbrevation: "Bm", color: UIColor.systemPink),
        19: EmotionCard(number:12, position: 19, name: "Досада", abbrevation: "D", color: UIColor.systemPink),
        20: EmotionCard(number:13, position: 20, name: "Тревога", abbrevation: "Tg", color: UIColor.systemPink),
        
        21: EmotionCard(number:14, position: 21, name: "Неудовольствие", abbrevation: "Nu", color: UIColor.systemYellow),
        22: EmotionCard(number:15, position: 22, name: "Страх", abbrevation: "St", color: UIColor.systemYellow),
        23: EmotionCard(number:16, position: 23, name: "Злость", abbrevation: "Z", color: UIColor.systemYellow),
        24: EmotionCard(number:17, position: 24, name: "Изумление", abbrevation: "Iz", color: UIColor.systemBlue),
        25: EmotionCard(number:18, position: 25, name: "Грусть", abbrevation: "Gr", color: UIColor.systemPink),
        26: EmotionCard(number:19, position: 26, name: "Вина", abbrevation: "Vn", color: UIColor.systemBlue),
        27: EmotionCard(number:20, position: 27, name: "Гнев", abbrevation: "Gn", color: UIColor.systemBlue),
        
        28: EmotionCard(number:21, position: 28, name: "Восхищение", abbrevation: "Wow", color: UIColor.systemBlue),
        29: EmotionCard(number:22, position: 29, name: "Доверие", abbrevation: "Dv", color: UIColor.systemYellow),
        30: EmotionCard(number:23, position: 30, name: "Ожидание", abbrevation: "Od", color: UIColor.systemYellow),
        31: EmotionCard(number:24, position: 31, name: "Радость", abbrevation: "Ra", color: UIColor.systemYellow),
        32: EmotionCard(number:25, position: 32, name: "Удивление", abbrevation: "Ogo", color: UIColor.systemYellow),
        33: EmotionCard(number:26, position: 33, name: "Интерес", abbrevation: "In", color: UIColor.systemPink),
        34: EmotionCard(number:27, position: 34, name: "Принятие", abbrevation: "Pn", color: UIColor.systemPink)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btn in displayCards {
            let index = displayCards.firstIndex(of: btn)!
            let emotionCard = emotionCards[index]
            if emotionCard != nil {
                btn.setTitleColor(UIColor.black, for: .normal)
                btn.setTitle(emotionCard?.abbrevation, for: UIControl.State.normal)
                btn.backgroundColor = emotionCard?.color
            }
            else {
                btn.backgroundColor = UIColor.systemBackground
            }
        }
    }

}

