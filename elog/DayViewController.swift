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
        let date = Date()
        var calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let position = ((minutes + hours * 60) - dailyGridBeginFromMin) / dailyGridPeriodMin
        print("index position = \(position)")
        //MARK: ask - how to scroll to specific cell ?
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dailyGridEndAtMin - dailyGridBeginFromMin) / 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayViewCellType", for: indexPath)

        cell.textLabel?.text = minToString(dayMinutes: dailyGridBeginFromMin + (dailyGridPeriodMin * indexPath.row))
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    private func minToString(dayMinutes: Int) -> String {
        let hours = dayMinutes / 60
        let minutes = dayMinutes % 60
        return String(format: "%02d:%02d",  arguments: [hours, minutes])
    }
}

// MARK: ask why it doesn't work
class DayViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var emotionLabel: UILabel?
}
