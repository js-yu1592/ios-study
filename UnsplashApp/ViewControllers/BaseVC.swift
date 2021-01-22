//
//  BaseVC.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/09.
//

import UIKit
import Toast_Swift
import WebKit

class BaseVC: UIViewController {
    
    // BaseVC를 만듬으로써 코드의 재사용성을 높임
    
    @IBOutlet weak var photoWebView: WKWebView!
    
    var vcTitle : String = "" {
        didSet{
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
            
        }
    }
    var photoUrl: String = "" {
        didSet {
            print("PhotoCollectionVC : \(photoUrl)")
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 인증 실패 노티피케이션 등록
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoWebView?.load(URLRequest(url: URL(string: photoUrl)!))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 노티피케이션 등록 해제
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    //MARK : - objc methods
    @objc func showErrorPopup(notification: NSNotification){
        print("BaseVC - showErrorPopup() called")
        
        if let data = notification.userInfo?["statusCode"] {
            print("showErrorPopup() data : \(data)")
            
            // 메인스레드에서 돌리기,즉 UI 스레드
            DispatchQueue.main.async {
                self.view.makeToast("💀\(data) 에러입니다.💀", duration: 2.0, position: .center)
            }
        }
    }
}
