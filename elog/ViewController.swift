//
//  ViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 6.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    let colorBlue   =   #colorLiteral(red: 0.6690862775, green: 0.8058274388, blue: 0.9767666459, alpha: 1)
    let colorYellow =   #colorLiteral(red: 0.9572288394, green: 0.8463208079, blue: 0.6030815244, alpha: 1)
    let colorPink   =   #colorLiteral(red: 0.9527825713, green: 0.7045833468, blue: 0.7854396701, alpha: 1)

    @IBOutlet var displayCards: [UIButton]!
    
    @IBOutlet weak var emCardText: UITextView!
    
    lazy var emotionCards = [
        0: EmotionCard(number:1, position: 0, name: "Ужас", abbrevation: "U", color: colorBlue),
        
        7: EmotionCard(number:2, position: 7, name: "Горе", abbrevation: "Go", color: colorBlue),
        8: EmotionCard(number:3, position: 8, name: "Отвращение", abbrevation: "Fu", color: colorBlue),
        9: EmotionCard(number:4, position: 9, name: "Настороженность", abbrevation: "Nr", color: colorBlue),
        12: EmotionCard(number:5, position: 12, name: "Стыд", abbrevation: "Sd", color: colorYellow),
        13: EmotionCard(number:6, position: 13, name: "Печаль", abbrevation: "P", color: colorYellow),
        
        14: EmotionCard(number:7, position: 14, name: "Восторг", abbrevation: "Vo", color: colorBlue),
        15: EmotionCard(number:8, position: 15, name: "Скука", abbrevation: "Sk", color: colorPink),
        16: EmotionCard(number:9, position: 16, name: "Смущение", abbrevation: "Sm", color: colorPink),
        17: EmotionCard(number:10, position: 17, name: "Растерянность", abbrevation: "Mm", color: colorPink),
        18: EmotionCard(number:11, position: 18, name: "Безмятежность", abbrevation: "Bm", color: colorPink),
        19: EmotionCard(number:12, position: 19, name: "Досада", abbrevation: "D", color: colorPink),
        20: EmotionCard(number:13, position: 20, name: "Тревога", abbrevation: "Tg", color: colorPink),
        
        21: EmotionCard(number:14, position: 21, name: "Неудовольствие", abbrevation: "Nu", color: colorYellow),
        22: EmotionCard(number:15, position: 22, name: "Страх", abbrevation: "St", color: colorYellow),
        23: EmotionCard(number:16, position: 23, name: "Злость", abbrevation: "Z", color: colorYellow),
        24: EmotionCard(number:17, position: 24, name: "Изумление", abbrevation: "Iz", color: colorBlue),
        25: EmotionCard(number:18, position: 25, name: "Грусть", abbrevation: "Gr", color: colorPink),
        26: EmotionCard(number:19, position: 26, name: "Вина", abbrevation: "Vn", color: colorBlue),
        27: EmotionCard(number:20, position: 27, name: "Гнев", abbrevation: "Gn", color: colorBlue),
        
        28: EmotionCard(number:21, position: 28, name: "Восхищение", abbrevation: "Wow", color: colorBlue),
        29: EmotionCard(number:22, position: 29, name: "Доверие", abbrevation: "Dv", color: colorYellow),
        30: EmotionCard(number:23, position: 30, name: "Ожидание", abbrevation: "Od", color: colorYellow),
        31: EmotionCard(number:24, position: 31, name: "Радость", abbrevation: "Ra", color: colorYellow),
        32: EmotionCard(number:25, position: 32, name: "Удивление", abbrevation: "Ogo", color: colorYellow),
        33: EmotionCard(number:26, position: 33, name: "Интерес", abbrevation: "In", color: colorPink),
        34: EmotionCard(number:27, position: 34, name: "Принятие", abbrevation: "Pn", color: colorPink)
    ]
    
    
    @IBAction func buttonPressed(_ button: UIButton) {
        let index = displayCards.firstIndex(of: button)!
        if let path = Bundle.main.path(forResource: "emocard-\(index)", ofType: "txt") {
          do {
              emCardText.text = try String(contentsOfFile: path, encoding: .utf8)
          } catch {
              
          }
        }
    
    }
    
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

