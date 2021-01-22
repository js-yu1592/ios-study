//
//  ViewController.swift
//  TagListViewApp
//
//  Created by 유준상 on 2020/12/31.
//

import UIKit
import TagListView

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagListView: TagListView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var appendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tagListView.delegate = self
        
        // IBAction 대신 addTarget을 통해 이벤트를 처리해줌
        appendBtn.addTarget(self, action: #selector(addTag), for: .touchUpInside)
        
    }
    
    @objc fileprivate func addTag(){
        print("ViewController - addTag() called")
        let userInput = textField.text ?? ""
        
        if userInput.count > 1 {
            tagListView.addTag(userInput)
            textField.text = nil
        } else {
            let alert = UIAlertController(title: "입력 값이 없습니다.", message: "내용을입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    //MARK: - TagListViewDelegate method

    //option + cmd + / 키를 누르면 문서화 스닙펫
    /// 태그가 눌렸을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트 뷰
    func tagPressed(title: String, tagView: TagView, sender: TagListView) {
        print("ViewController - tagPress() called / tag title, sender : \(title), \(sender)")
        // 해당 태그뷰의 true/false 값을 토글시켜줌
        tagView.isSelected.toggle()
    }

    /// 태그 삭제버튼이 클릭되었을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트 뷰
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("ViewController - tagPress() called")
        sender.removeTagView(tagView)
    }
    
//    @IBAction func appendBtnCliked(_ sender: UIButton) { // 내가 작성
//        guard let text = textField.text else {
//            return
//        }
//        let tagView = tagListView.addTag(text)
//        tagView.tagBackgroundColor = UIColor.blue
//        tagView.onTap = { tagView in
//            print("Don’t tap me!")
//        }
//
//    }
}

