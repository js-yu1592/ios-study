//
//  ViewController.swift
//  EasyTipViewApp
//
//  Created by 유준상 on 2021/01/18.
//

import UIKit
import EasyTipView

class ViewController: UIViewController {

    @IBOutlet var centerBtn: UIButton!
    @IBOutlet var topLeadingBtn: UIButton!
    @IBOutlet var topTrailingBtn: UIButton!
    @IBOutlet var bottomLeadingBtn: UIButton!
    @IBOutlet var bottomTrailingBtn: UIButton!
    
    lazy var centerToolTip = EasyTipView(text: "")
    lazy var topLeadingToolTip = EasyTipView(text: "")
    lazy var topTrailingToolTip = EasyTipView(text: "")
    lazy var bottomLeadingToolTip = EasyTipView(text: "")
    lazy var bottomTrailingToolTip = EasyTipView(text: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func onBtnClicked(sender: UIButton){
        print("ViewController - onBtnClicked() called")
        
        switch sender {
        case centerBtn:
            print("centerBtn is Clicked")
            
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            preferences.drawing.arrowPosition = .left
            
            // 속성에 따른 툴팁을 만듬
            centerToolTip = EasyTipView(text: "안녕하세요!😃😃", preferences: preferences, delegate: self)
            centerToolTip.show(animated: true, forView: self.centerBtn, withinSuperview: self.view)
            
        case topLeadingBtn:
            print("topLeadingBtn is Clicked")
            
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            preferences.drawing.arrowPosition = .top
            preferences.drawing.textAlignment = .right
            preferences.animating.dismissDuration = 2
            preferences.animating.dismissTransform = CGAffineTransform(translationX: -50, y: 0)
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: 100)
            preferences.animating.showDuration = 2
            
            // 속성에 따른 툴팁을 만듬
            topLeadingToolTip = EasyTipView(text: "하하하 호호호!😂😂", preferences: preferences, delegate: self)
            topLeadingToolTip.show(animated: true, forView: self.topLeadingBtn, withinSuperview: self.view)
            
        case topTrailingBtn:
            print("topTrailingBtn is Clicked")
            
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            preferences.drawing.arrowPosition = .bottom
            preferences.drawing.textAlignment = .right
            preferences.animating.dismissDuration = 2
            preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: -100)
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: -100)
            preferences.animating.showDuration = 2
            
            // 속성에 따른 툴팁을 만듬
            topTrailingToolTip = EasyTipView(text: "ㅠㅠ 😢😢", preferences: preferences, delegate: self)
            topTrailingToolTip.show(animated: true, forView: self.topTrailingBtn, withinSuperview: self.view)
            
        case bottomLeadingBtn:
            print("bottomLeadingBtn is Clicked")
            
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont.boldSystemFont(ofSize: 20)
            preferences.drawing.foregroundColor = .white
            preferences.drawing.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            preferences.drawing.arrowPosition = .bottom
            preferences.drawing.textAlignment = .right
            preferences.animating.dismissDuration = 2
            preferences.animating.dismissTransform = CGAffineTransform(translationX: -50, y: 0)
            preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: -100)
            preferences.animating.showDuration = 2
            
            // 속성에 따른 툴팁을 만듬
            bottomLeadingToolTip = EasyTipView(text: "ㅡㅡ 😡😡", preferences: preferences, delegate: self)
            bottomLeadingToolTip.show(animated: true, forView: self.bottomLeadingBtn, withinSuperview: self.view)
            
        case bottomTrailingBtn:
            print("bottomTrailingBtn is Clicked")
            
            var preferences = EasyTipView.globalPreferences
           //            preferences.drawing.backgroundColor = bottomRightBtn.backgroundColor!
                       preferences.drawing.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                       preferences.drawing.borderWidth = 5
                       preferences.drawing.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

                       preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: -15)
                       preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: 15)
                       preferences.animating.showInitialAlpha = 0
                       preferences.animating.showDuration = 1
                       preferences.animating.dismissDuration = 1
                       preferences.drawing.arrowPosition = .top
                       
                       // 패딩
                       preferences.positioning.contentInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                       
           //            let contentView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                       let contentView = UIView(frame: CGRect(x: 0 , y: 0, width: 100, height: 100))
                       
                       contentView.translatesAutoresizingMaskIntoConstraints = false
                       
                       contentView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
                        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
            
                       let myImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                       myImgView.image = UIImage(named: "1")
                       contentView.addSubview(myImgView)
                       
                       myImgView.translatesAutoresizingMaskIntoConstraints = false
                       myImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    
                       myImgView.widthAnchor.constraint(equalToConstant: 90).isActive = true
                       myImgView.heightAnchor.constraint(equalToConstant: 90).isActive = true
                       myImgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
                       
//                       let myLabel = UILabel(frame: .zero)
//                       myLabel.text = "포뇨 🐟🐟"
//                       myLabel.font = UIFont.boldSystemFont(ofSize: 20)
//
//                       myLabel.numberOfLines = 0
//                       myLabel.textColor = .black
//                       contentView.addSubview(myLabel)
//
//                       myLabel.translatesAutoresizingMaskIntoConstraints = false
//                       myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//                       myLabel.topAnchor.constraint(equalTo: myImgView.bottomAnchor, constant: 10).isActive = true
//                       myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                       
                       contentView.layoutIfNeeded()
                       
                       bottomTrailingToolTip = EasyTipView(contentView: contentView, preferences: preferences, delegate: self)
                       
                       
                       bottomTrailingToolTip.show(forView: bottomTrailingBtn)
            
        default:
            print("default")
        }
    }

}

extension ViewController: EasyTipViewDelegate {
    func easyTipViewDidTap(_ tipView: EasyTipView) {
        print("easyTipViewDidTap() called")
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        print("easyTipViewDidDismiss() called")
    }
}

