//
//  MainScreenViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 7.02.22.
//

import UIKit
import SQLite


class MainScreenViewController : UIViewController {
    @IBOutlet var appTitleLabel: UILabel!
    @IBOutlet var dayViewButton: UIButton!
    @IBOutlet var emotionsTableViewButton: UIButton!
    @IBOutlet var dbConnect: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dbConnectPressed(_ sender: UIButton) {
        EmotionLogOperations.shared.testOperation()
    }
}
