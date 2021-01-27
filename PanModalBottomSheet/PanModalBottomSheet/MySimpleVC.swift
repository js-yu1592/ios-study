//
//  MySimpleVC.swift
//  PanModalBottomSheet
//
//  Created by 유준상 on 2021/01/27.
//

import Foundation
import UIKit
import PanModal

class MySimpleVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MySimpleVC - viewDidLoad() called")
    }
    
    @IBAction func onConfirmBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension MySimpleVC: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
//    // 접힌 상태
//    var shortFormHeight: PanModalHeight {
//        return .contentHeight(300)
//    }
//    // 완전 펼쳐진 상태
//    var longFormHeight: PanModalHeight {
//        // 펼쳐진 상태인데, 위의 inset을 100만큼 띄게 함
//        return .contentHeight(300)
//    }
//    var anchorModalToLongForm: Bool {
//        // true면 화면 최상단까지 스크롤이 안됨
//        // false면 화면 최상단까지 스크롤이 됨
//        return false
//    }
}
