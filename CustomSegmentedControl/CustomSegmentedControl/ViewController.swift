//
//  ViewController.swift
//  CustomSegmentedControl
//
//  Created by 유준상 on 2021/01/21.
//

import UIKit

// 전체적으로 ViewController에서는 세그먼트 컨트롤을 만들고 오토레이아웃을 설정하고 세그먼트 컨트롤의 이벤트, 특정 속성 설정은 MyCustomSegmentControl에서 설정
class ViewController: UIViewController, MyCustomSegmentControlDelegate {
    // 라벨에 쓸 요일 Arr
    var myDayArr = ["월", "화", "수", "목", "금"]
    var myDayCharacterArray = ["🐶", "🐱", "🐯", "🐹", "🐰"]
    
    // 요일을 바꾸기 위해 Label을 연결
    @IBOutlet weak var whatDayTitle: UILabel!
    
    // MyCustomSegmentControlDelegate가 요구하는 함수 구현, index에 따라 Label의 값을 변경하는 함수
    func segmentValueChange(to index: Int) {
        print("ViewController - sehmentValueChanged() called / index : \(index)")
        self.whatDayTitle.text = myDayArr[index] + "요일\n" + myDayCharacterArray[index]
    }
    
    // viewDidLoad()전에 호출
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        // 세그먼트 컨트롤 클래스의 인스턴스를 생성, convenience init 호출
        let myCustomSegmentControl = MyCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: myDayArr)
        // 델리게이트 사용
        myCustomSegmentControl.mySegmentDelegate = self
        // 세그먼트 컨트롤을 뷰에 놓음
        self.view.addSubview(myCustomSegmentControl)
        
        // 세그먼트 컨트롤에 대한 오토레이아웃 설정
        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
//        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 400).isActive = true
        myCustomSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        myCustomSegmentControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        myCustomSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

