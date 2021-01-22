//
//  ViewController.swift
//  AutoLayoutCode02
//
//  Created by 유준상 on 2021/01/16.
//

import UIKit

class ViewController: UIViewController {
    
    var someViewBottomConstraint: NSLayoutConstraint?
    
    // viewDidLoad() 의 코드를 줄이기 위해 loadView()에 작성, viewDidLoad()보다 먼저 호출됨
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        self.view.backgroundColor = UIColor(named: "MY_YELLOW") // Assets에 컬러를 커스텀해서 사용
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "MY_BLUE")
        someView.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 코드를 작동시키기 위해서 필수
        view.addSubview(someView)
        someView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([ // 컨스트레인트를 배열로 추가, .isActive를 추가하지 않아도 됨
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            someView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        // 바텀 앵커를 따로 변수에 저장하여 유동적으로 컨스트레인트를 바꿀수 있도록 함
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        
        let moveViewUpBtn = UIButton(type: .system) // 버튼을 코드로 작성하기
        moveViewUpBtn.translatesAutoresizingMaskIntoConstraints = false
        moveViewUpBtn.backgroundColor = .white
        moveViewUpBtn.setTitle("위로 올리기", for: .normal)
        moveViewUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveViewUpBtn.setTitleColor(.black, for: .normal)
        moveViewUpBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        moveViewUpBtn.layer.cornerRadius = 8
        
        moveViewUpBtn.addTarget(self, action: #selector(moveViewUp), for: .touchUpInside) // 버튼이 눌렸을때 함수 호출
        self.view.addSubview(moveViewUpBtn)
        
        moveViewUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveViewUpBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        
        
    }
    
    @objc fileprivate func moveViewUp() {
        print("ViewController - moveViewUp() called")
        
        // 애니메이션 처리
        someViewBottomConstraint?.constant -= 100
        
        UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: { [weak self] in
            guard let self = self else { return } // ARC, 클로저에서 Strong Reference Cycle을 해결하기 위해 weak self 사용
            
            self.view.layoutIfNeeded() // 뷰의 컨스트레인트가 바뀌었을때 다시 적용시키라는 애니메이션
        }).startAnimation()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad() called")
        
    }

}
// SwiftUI 미리보기
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
    struct ViewController_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerRepresentable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 미리보기의 safeArea까지 모두 채워짐
                .previewDisplayName("iPhone 11")
        }
    }
}
#endif

