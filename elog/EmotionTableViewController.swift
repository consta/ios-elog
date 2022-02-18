//
//  ViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 6.11.21.
//

import UIKit
import CoreData

final class EmotionTableViewController: UIViewController {
    
    let colorBlue   =   #colorLiteral(red: 0.6690862775, green: 0.8058274388, blue: 0.9767666459, alpha: 1)
    let colorYellow =   #colorLiteral(red: 0.9572288394, green: 0.8463208079, blue: 0.6030815244, alpha: 1)
    let colorPink   =   #colorLiteral(red: 0.9527825713, green: 0.7045833468, blue: 0.7854396701, alpha: 1)

    let forDate: Date?
    
    var logEntries: [NSManagedObject] = []
    
    // TODO: look if it is more reasonable to implement this using CollectionView
    @IBOutlet private var displayCards: [UIButton]!
    
    @IBOutlet private weak var emCardText: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func buttonPressed(_ button: UIButton) {
        // MARK: - some sample text
        let index = displayCards.firstIndex(of: button)!
        // TODO: implement caching
        if let path = Bundle.main.path(forResource: "txt/emocard-\(index)", ofType: "txt") {
          do {
              emCardText.text = try String(contentsOfFile: path, encoding: .utf8)
          } catch let error as NSError {
              fatalError(error.localizedDescription)
          }
        }
        
        displayCards
            .filter {card in return card.layer.borderWidth > 0}
            .forEach {card in card.layer.borderWidth = 0}
        button.layer.borderWidth = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btn in displayCards {
            let index = displayCards.firstIndex(of: btn)!
            let emotionType = EmotionType.getByPosition(position: index)
            if let emotionType = emotionType {
                btn.setTitleColor(UIColor.black, for: .normal)
                btn.setTitle(emotionType.attributes.abbrevation, for: UIControl.State.normal)
                btn.backgroundColor = emotionType.attributes.color
            }
            else {
                btn.backgroundColor = UIColor.systemBackground
            }
        }
        if forDate != nil {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Add", style: .plain, target: self, action: #selector(addTapped))
        }
        let date = forDate ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let dateValue = dateFormatter.string(from: date)
        print("dateValue = \(dateValue)")
        dateLabel.text = dateValue
    }
    
    required init?(coder: NSCoder) {
        //fatalError("This should never be called")
        self.forDate = Date()
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, forDate: Date?) {
        self.forDate = forDate
        super.init(coder: coder)
    }

    @objc func addTapped(_ sender: Any) {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        
        // 1
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
          NSEntityDescription.entity(forEntityName: "EmotionLogEntry",
                                     in: managedContext)!
        
        let logEntry = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        guard let buttonSelected = displayCards
                .filter({card in return card.layer.borderWidth > 0}).first else {
                    fatalError("nothing selected")
                }
        let emotionSelected = displayCards.firstIndex(of: buttonSelected)!
        logEntry.setValue(emotionSelected, forKeyPath: "emotionId")
        logEntry.setValue(30, forKeyPath: "duration")
        logEntry.setValue(forDate, forKeyPath: "timestamp")
        
        // 4
        do {
          try managedContext.save()
            print("saved")
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

