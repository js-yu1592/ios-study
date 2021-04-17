//
//  ViewController.swift
//  BarChartApp
//
//  Created by 유준상 on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barChartView: BeautifulBarChart!
    
    let ageArray = ["10대","20대","30대","40대","50대","60대","70대 이상"]
    let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dataEntries = self.generateDataEntries()
        self.barChartView.updateDataEntries(dataEntries: dataEntries, animated: true)

    }
    func generateDataEntries() -> [DataEntry] {
        var result: [DataEntry] = []
        let values = [19,32,45,33,44,89,3]
    
        Array(0..<ageArray.count).forEach { (index) in
            let height: Float = Float(values[index]) / 100.0
            result.append(DataEntry(color: colors[index], height: height, textValue: "\(values[index])", title: ageArray[index]))
        }
        return result
    }

}

