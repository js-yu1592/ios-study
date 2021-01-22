//
//  ViewController.swift
//  CustomPopUpApp
//
//  Created by 유준상 on 2020/11/17.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopUpDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 노티피케이션이라는 방송 수신기를 장착, 노티피케이션 방송을 뿌려주면 name에 적합한 이벤트(방송)를 작동시킴
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    @objc fileprivate func loadWebView(){
        print("ViewController - loadWebViewloadWebView() called")
        
        let blogUrl = URL(string: "https://blog.naver.com/kor216465")
        self.myWebView.load(URLRequest(url: blogUrl!))
        
    }

    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해 팝업 뷰 컨트롤러 가져오기
        let customPopUpViewController = storyboard.instantiateViewController(identifier: "AlertPopUpViewController") as
            CustomPopUpViewController // 자료형을 확실히 함
        // 팝업효과 설정, 효과 설정 안했을때 기본적으로 아래에서 위로 내려오는 기본 효과가 나타남,뷰 컨트롤러가 보여지는 스타일
        customPopUpViewController.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일, .crossDissolve 설정시 스르륵 사라지게 됨
        customPopUpViewController.modalTransitionStyle = .crossDissolve
        
        customPopUpViewController.subscribeBtnCompletionClosure = {
            print("컴플레션 블록이 호출됨")
            let channelUrl = URL(string: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA")
            self.myWebView.load(URLRequest(url: channelUrl!))
        }
        customPopUpViewController.popUpDelegate = self
        // .present 는 스택처럼 화면이 쌓이는게 아니라 현재 뷰에서 덮여씌워 보여줌
        self.present(customPopUpViewController, animated: true, completion: nil)
    
    }
    // MARK: - PopUpDelegate Method
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")
        
        let openChatUrl = URL(string: "https://open.kakao.com/o/gxOOKJec")
        self.myWebView.load(URLRequest(url: openChatUrl!))
        
    }
    
}

