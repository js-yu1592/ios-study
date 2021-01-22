//
//  ViewController.swift
//  StackViewApp
//
//  Created by 유준상 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet var phoneNumberBtns: [CircleButton]!
    
    @IBOutlet weak var phoneCallBtn: CircleButton!
    
    var phoneNumberString = ""{
        didSet {
            // 메인 스레드에서 작동
            DispatchQueue.main.async { [weak self] in // ARC, 메모리를 약하게 잡음
                guard let self = self else { return }
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for btnItem in phoneNumberBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnCliked(sender:)), for: .touchUpInside)
        }
        phoneCallBtn.addTarget(self, action: #selector(onCallBtnClicked(sender:)), for: .touchUpInside)
    }

    @objc fileprivate func onNumberBtnCliked(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    @objc fileprivate func onCallBtnClicked(sender: UIButton){
        phoneNumberString.removeAll()
    }
}

