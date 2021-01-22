//
//  ViewController.swift
//  TextViewPlaceHolderApp
//
//  Created by 유준상 on 2020/12/03.
//

import UIKit
import UITextView_Placeholder

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.layer.cornerRadius = 20
        
        textView.placeholder = "Hi. This is TextView PlaceHolder!!"+"\n"+"글을 입력해주세요"
        textView.placeholderColor = #colorLiteral(red: 0.7090862393, green: 0.6051253676, blue: 0.3739359975, alpha: 0.8815428027)// optional
    }


}

