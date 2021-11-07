//
//  ViewController.swift
//  elog
//
//  Created by Kanstantin Kachanouski on 6.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cards: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btn in cards {
            let index = cards.firstIndex(of: btn)!
            let title: String = "\(index)"
            btn.setTitle(title, for: UIControl.State.normal)
        }
    }


}

