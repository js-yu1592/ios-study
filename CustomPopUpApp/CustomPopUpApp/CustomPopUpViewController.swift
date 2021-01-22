//
//  CustomPopUpViewController.swift
//  CustomPopUpApp
//
//  Created by 유준상 on 2020/11/17.
//

import UIKit

class CustomPopUpViewController: UIViewController {

    @IBOutlet weak var bgBtn: UIButton!
    
    @IBOutlet weak var subscribeBtn: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var openChatBtn: UIButton!
    
    @IBOutlet weak var blogBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var popUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
    }
    
    // MARK: -IBActions
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBlogBtnClicked() called")
        
        // 노티피케이션 방송을 모든 뷰에 송신해줌
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        // .dissmiss() 현재 창을 닫아주는 역할
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        // 컴플레션 블록 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            // 메인에 알린다
            subscribeBtnCompletionClosure()
        }
        
    }
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
        popUpDelegate?.onOpenChatBtnClicked()
    }
}
