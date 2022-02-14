//
//  DayViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 7.02.22.
//

import UIKit

class DayViewController : UITableViewController {
    
    let dailyGridBeginFromMin = 0
    let dailyGridEndAtMin = 24 * 60
    let dailyGridPeriodMin = 30
    
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
            fatalError("Should not be!")
        }
        
        cell.timeLabel?.text = minToString(dayMinutes: dailyGridBeginFromMin + (dailyGridPeriodMin * indexPath.row))
        cell.emotionLabel?.text = ""
        
        return cell
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

