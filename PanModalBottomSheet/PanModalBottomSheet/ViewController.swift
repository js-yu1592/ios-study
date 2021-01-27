//
//  ViewController.swift
//  PanModalBottomSheet
//
//  Created by 유준상 on 2021/01/27.
//

import UIKit
import PanModal

class ViewController: UIViewController {

    @IBOutlet weak var tableModalBtn: UIButton!
    @IBOutlet weak var halfModalBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad() called")
    }


    @IBAction func onModalBtnClicked(_ sender: UIButton) {
        print("ViewController - onModalBtnClicked() called")
         
        switch sender {
        case tableModalBtn:
            print("tableModalBtn clicked")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyTableVC") as! MyTableVC
            presentPanModal(vc)
        case halfModalBtn:
            print("tableModalBtn clicked")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MySimpleVC") as! MySimpleVC
            presentPanModal(vc)
        default:
            break
        }
    }
}

