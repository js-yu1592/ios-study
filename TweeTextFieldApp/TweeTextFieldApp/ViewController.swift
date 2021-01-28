//
//  ViewController.swift
//  TweeTextFieldApp
//
//  Created by 유준상 on 2021/01/28.
//

import UIKit
import TweeTextField

class ViewController: UIViewController {

    @IBOutlet weak var myPasswordTextField: TweeAttributedTextField!
    
    @IBOutlet weak var myEmailTextField: TweeAttributedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이메일 텍스트필드 설정
//        myEmailTextField.placeholder = "이메일을 입력해주세요!"
        myEmailTextField.tweePlaceholder = "이메일을 입력해주세요!"
        myEmailTextField.placeholderColor = .darkGray
        myEmailTextField.placeholderDuration = 0.2
        myEmailTextField.minimizationAnimationType = .smoothly
        myEmailTextField.infoAnimationDuration = 0.2
        myEmailTextField.minimumFontSize = 16
        myEmailTextField.originalPlaceholderFontSize = 20
    }
    // 비밀번호 글자 입력이 시작될 때
    @IBAction func passwordBeginEditing(_ sender: TweeAttributedTextField) {
        
    }
    // 비밀번호 글자가 입력중 일 때
    @IBAction func passwordWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.activeLineColor = .white
                sender.hideInfo(animated: true)
                return
            }
            if userInput.count < 8 {
                sender.infoTextColor = .red
                sender.activeLineColor = .red
                sender.showInfo("8글자 이상 입력하세요!", animated: true)
            } else {
                sender.infoTextColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                sender.showInfo("잘하셨습니다.", animated: true)
            }
        }
        
    }
    // 비밀번호 글자 입력이 끝났을 때
    @IBAction func passwordEndEditing(_ sender: TweeAttributedTextField) {
        
        
    }
    
    @IBAction func myEmailWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 { // 텍스트에 아무것도 안쓰여있다면
                sender.activeLineColor = .white
                sender.hideInfo(animated: true)
                return
            }
            if userInput.isValidEmail == true { // 이메일 형식이라면
                sender.infoTextColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                sender.showInfo("이메일 형식입니다!", animated: true)
            } else {
                sender.infoTextColor = .red
                sender.activeLineColor = .red
                sender.showInfo("이메일 형식이 아닙니다!.", animated: true)
            }
        }
    }
    
}


extension String {
    var isValidEmail: Bool { // 이메일 정규화
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
