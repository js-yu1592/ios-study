//
//  MyCustomSegmentControl.swift
//  CustomSegmentedControl
//
//  Created by 유준상 on 2021/01/21.
//

import Foundation
import UIKit
// 프로토콜 델리겟을 만들어 다른 클래스에서 index를 사용할 수 있도록 함
protocol MyCustomSegmentControlDelegate: class {
    // 아이템이 선택
    func segmentValueChange(to index: Int)
}

// 세그먼트 컨트롤은 UIView타입 , 세그먼트 컨트롤을 버튼으로 만들어 커스텀함
class MyCustomSegmentControl: UIView {
    private var buttonTitles: [String]! // 버튼의 타이틀들
    private var buttons: [UIButton]! // 버튼들
    
    // 자주쓰이는 textColor와 selectedColor를 변수로 지정
    var textColor: UIColor = .black
    var selectedColor: UIColor = #colorLiteral(red: 0.9940208793, green: 0.4186933041, blue: 0.588052094, alpha: 1)
    
    // 외부에서 사용 가능하지만 값을 변경하지는 못함
    public private(set) var selectedIndex: Int = 0
    
    // 프로토콜의 func을 호출하기 위해, 호출을 해야 ViewController로 인덱스값을 넘겨줄 수 있음
    weak var mySegmentDelegate: MyCustomSegmentControlDelegate?
    
    // 기본적인 뷰 설정
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    // 데이터를 뷰에 적용할때 많이 쓰임 convenience
    convenience init(frame: CGRect, buttonTitles: [String]) {
        print("MyCustomSegmentControl - convenience init() called")
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
        
    }
    // UIView와 UIViewController는 NSCoding프로토콜을 구현하고 있으므로 이를 상속받은 자식 클래스에서도 반드시 구현해줘야함
    // 자식클래스에서 이니셜라이저를 작성하게 되면, 부모 클래스의 이니셜라이저들이 자동상속되지 않아 required init?(coder:)를 구현해야함
    // 부모클래스의 이니셜라이저를 상속했으므로 자동으로 나머지 이니셜라이저도 상속됨
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    // draw 메서드, 뷰를 그림
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("MyCustomSegmentControl - draw() called")
        updateView()
    }
    // 버튼을 만들고 스택뷰를 설정, 스택뷰에 버튼을 넣어 세그먼트 컨트롤처럼 사용할 계획
    fileprivate func updateView(){
        print("MyCustomSegmentControl - updateView() called")
        
        // 버튼 만들기
        createBtn()

        // 스택뷰 설정 하기
        configStackView()
    }
    // 버튼을 생성
    fileprivate func createBtn(){
        print("MyCustomSegmentControl - createBtn() called")
        // 버튼들을 만듬, 인스턴스
        self.buttons = [UIButton]()
        // 기존 버튼들을 다 지움, 빈 버튼
        self.buttons.removeAll()
        
       // 하위 뷰들을 다 지움
        subviews.forEach({$0.removeFromSuperview()})
        // 버튼 타이틀 개수만큼 버튼을 생성
        for buttonTitleItem in buttonTitles {
            // 버튼 상수를 만들어 설정하고 buttons 배열에 append함
            let button = UIButton(type: .system)
            
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            // 테두리 넓이와 색상
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            button.layer.cornerRadius = 20
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            // 컨텐트 내 글자와 테두리 사이의 패딩 값을 지정해줌
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            // 뷰의 크기에 비해 글자가 너무 많을때 글자를 줄어들게함 50%까지
            button.titleLabel?.minimumScaleFactor = 0.5
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            
            // 버튼 타이틀을 버튼에 적용시킴, 버튼 타이틀은 convenience init()이 호출될때 초기화됐던 값
            button.setTitle(buttonTitleItem, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            // 버튼을 클릭했을때 이벤트를 발동
            button.addTarget(self, action: #selector(MyCustomSegmentControl.buttonAction(_: )), for: .touchUpInside)
            
            self.buttons.append(button)
        }
        // 초기 버튼 설정
        buttons[0].setTitleColor(.white, for: .normal)
        buttons[0].backgroundColor = selectedColor
        
    }
    // 스택뷰에 대한 설정
    fileprivate func configStackView(){
        print("MyCustomSegmentControl - configStackView() called")
        
        // 스택뷰에 buttons들을 넣어 만듬
        let stackView = UIStackView(arrangedSubviews: buttons)
        // 가로로 할지, 세로로 할지 결정, 뷰들을 쌓는 방향 axis속성
        stackView.axis = .horizontal
        // 정렬을 어느 방향으로 할지 결정, axis값에 따라 나오는 속성이 다름
        stackView.alignment = .center
        // 뷰들의 크기를 결정, fillEqually를 하면 다같은 크기로 채워짐
        stackView.distribution = .fillEqually
        // 뷰들간의 간격 설정
        stackView.spacing = 20
        self.addSubview(stackView)
        
        // 스택뷰 오토레이아웃 설정
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    
    // 세그먼트 버튼이 선택되었을때 이벤트 발동
    @objc func buttonAction(_ sender: UIButton){
        // arr.enumerated()는 배열의 인덱스를 가져옴, 튜플 형태로 리턴 (n,x), 배열의 index와 해당 값을 모두 가져올때 사용
        for(buttonIndex, btn) in buttons.enumerated() {
            if btn == sender {
                self.selectedIndex = buttonIndex
                // ViewController에 인덱스 값을 넘겨줌
                mySegmentDelegate?.segmentValueChange(to: self.selectedIndex)
                btn.backgroundColor = selectedColor
                btn.setTitleColor(.white, for: .normal)
                
            } else {
                btn.backgroundColor = .white
                btn.setTitleColor(textColor, for: .normal)
            }
        }
        print("MyCustomSegmentControl - buttonAction() called / selectedIndex : \(self.selectedIndex)")
    }
}
