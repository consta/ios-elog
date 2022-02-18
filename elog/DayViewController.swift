//
//  DayViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 7.02.22.
//

import UIKit
import CoreData

class DayViewController : UITableViewController {
    
    let dailyGridBeginFromMin = 0
    let dailyGridEndAtMin = 24 * 60
    let dailyGridPeriodMin = 30
    var logEntries: Dictionary<Int, NSManagedObject> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rows = tableView.numberOfRows(inSection: 0)
        print("rows = \(rows)")
        let indexPath = dateToIndexPath(date: Date())
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dailyGridEndAtMin - dailyGridBeginFromMin) / 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayViewCellType", for: indexPath)
        
        guard let cell = cell as? DayViewCell else {
            fatalError("The thing that should not be")
        }
        
        cell.timeLabel?.text = minToString(dayMinutes: dailyGridBeginFromMin + (dailyGridPeriodMin * indexPath.row))
        let record = logEntries[indexPath.row]
        if record != nil {
            let emotionId = record?.value(forKey: "emotionId") as! Int
            cell.emotionLabel?.text = String(format: "%d", emotionId)
            
        } else {
            cell.emotionLabel?.text = ""
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        //2
        let calendar = Calendar.current
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EmotionLogEntry")
        fetchRequest.predicate = NSPredicate(format: "timestamp >= %@", calendar.startOfDay(for: Date()) as CVarArg)
        
        //3
        do {
            let records = try managedContext.fetch(fetchRequest)
            for record in records {
                guard let date = record.value(forKey: "timestamp") as? Date else {
                    fatalError("Unexpected date format")
                }
                let hours = calendar.component(.hour, from: date)
                let minutes = calendar.component(.minute, from: date)
                let index = ((minutes + hours * 60) - dailyGridBeginFromMin) / dailyGridPeriodMin
                logEntries[index] = record
            }
            print("loaded")
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    private func minToString(dayMinutes: Int) -> String {
        let hours = dayMinutes / 60
        let minutes = dayMinutes % 60
        return String(format: "%02d:%02d",  arguments: [hours, minutes])
    }
    
    private func dateToIndexPath(date: Date) -> IndexPath {
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let position = ((minutes + hours * 60) - dailyGridBeginFromMin) / dailyGridPeriodMin
        return IndexPath(row: position, section: 0)
    }
    
    private func indexPathToDate(indexPath: IndexPath) -> Date {
        let minutesDay = dailyGridPeriodMin * indexPath.row
        let hours = minutesDay / 60;
        let minutes = minutesDay % 60;
        return Calendar.current.date(bySettingHour: hours, minute: minutes, second: 0, of: Date())!
    }
    
    @IBSegueAction func pickupEmotion(_ coder: NSCoder, sender: Any?) -> EmotionTableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("No rows selected!")
        }
        return EmotionTableViewController(coder: coder, forDate: indexPathToDate(indexPath: indexPath))
    }
}



// MARK: ask why it doesn't work
class DayViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var emotionLabel: UILabel?
}

