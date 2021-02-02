//
//  DateViewController.swift
//  FSCalendarApp
//
//  Created by 유준상 on 2021/02/02.
//

import Foundation
import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var dateText = ""
    
    override func loadView() {
        super.loadView()
        
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.dateLabel.text = dateText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
