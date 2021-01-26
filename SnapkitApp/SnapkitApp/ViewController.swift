//
//  ViewController.swift
//  SnapkitApp
//
//  Created by 유준상 on 2021/01/26.
//

import UIKit
import SnapKit

// 오토레이아웃의 코드를 짧게 하기위해 snapkit api를 사용, 현업에서 많이 사용됨
class ViewController: UIViewController {

//    var didSetupConstraints = false

    lazy var yellowView: UIView = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    lazy var redView: UIView = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    lazy var blueView: UIView = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    lazy var greenView: UIView = { () -> UIView in
       let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    lazy var myButton = { (color: UIColor) -> UIButton in
        let button = UIButton(type: .system)
        button.setTitle("내 버튼", for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        return button
    }
    
    var greenViewTopConstraint: Constraint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad() called")

        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        
        let myDarkGrayBtn = myButton(.darkGray)
        self.view.addSubview(myDarkGrayBtn)
        
        yellowView.snp.makeConstraints { make in
//                make.top.equalTo(view.snp.top).offset(15.0)
//                make.bottom.equalTo(view.snp.bottom).offset(-15.0)
//                make.left.equalTo(view.snp.left).offset(15.0)
//                make.right.equalTo(view.snp.right).offset(-15.0)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)) // 위의 4줄을 한줄로 줄임
        }

        redView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            // make.size.equalTo(CGSize(width: 100, height: 100)) 위와 같은 의미
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        
        }

        blueView.snp.makeConstraints { make in
//                make.left.equalTo(yellowView.snp.left).offset(50.0)
//                make.size.equalTo(CGSize(width: 0, height: 100)) // width는 오토레이아웃으로 설정되는 크기, 어떻게처리? 해결: width, height만 따로 처리가능
//                make.width.height.equalTo(100)
//                make.width.equalTo(redView.snp.width).dividedBy(2)
            
            make.width.equalTo(redView.snp.width).multipliedBy(2)
            make.height.equalTo(redView.snp.height)
            make.top.equalTo(redView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
        }

        greenView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.size.equalTo(CGSize(width: 100, height: 100))
            make.width.height.equalTo(100)
            self.greenViewTopConstraint = make.top.equalTo(blueView.snp.bottom).offset(20).constraint
        }

        myDarkGrayBtn.snp.makeConstraints{ make in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            
//            make.left.equalTo(yellowView.snp.left).offset(80.0)
//            make.size.equalTo(CGSize(width: 150, height: 120))
           
        }
        
//        view.setNeedsUpdateConstraints()

        myDarkGrayBtn.addTarget(self, action: #selector(moveGreenView(_:)), for: .touchUpInside)

    }
    
    var offset = 0 // offset을 추가해줘 constraint를 점점 늘리도록 함
    
    @objc fileprivate func moveGreenView(_ sender: UIButton){
        offset += 40
        print("ViewController - moveGreenView() called / offset : \(offset)")
        
        self.greenViewTopConstraint?.update(offset: offset)
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: { // 애니메이션 추가
            self.view.layoutIfNeeded()
        }).startAnimation()
    }

    // 뷰의 constraint를 업데이트해주는 함수, viewDidLoad()가 너무 길기때문에 이 함수를 쓰는것이 좋을 것 같음
//    override func updateViewConstraints() {
//        print("ViewController - updateViewConstraints() called")
//        if (!didSetupConstraints) {
//
//            yellowView.snp.makeConstraints { make in
////                make.top.equalTo(view.snp.top).offset(15.0)
////                make.bottom.equalTo(view.snp.bottom).offset(-15.0)
////                make.left.equalTo(view.snp.left).offset(15.0)
////                make.right.equalTo(view.snp.right).offset(-15.0)
//                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
//            }
//
//            redView.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
////                make.size.equalTo(CGSize(width: 100, height: 100))
//                make.width.height.equalTo(100)
//            }
//
//            blueView.snp.makeConstraints { make in
////                make.left.equalTo(yellowView.snp.left).offset(50.0)
////                make.size.equalTo(CGSize(width: 0, height: 100)) // width는 오토레이아웃으로 설정되는 크기, 어떻게처리?
////                make.width.height.equalTo(100)
////                make.width.equalTo(redView.snp.width).dividedBy(2)
//
//                make.centerX.equalToSuperview()
//                make.top.equalTo(redView.snp.bottom).offset(20)
//                make.width.equalTo(redView.snp.width).multipliedBy(2)
//                make.height.equalTo(redView.snp.height)
//
//
//            }
//
//            greenView.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(blueView.snp.bottom).offset(20.0)
//                make.size.equalTo(CGSize(width: 100, height: 100))
//            }
//
//            myDarkGrayBtn.snp.makeConstraints{ make in
//                make.centerX.super
//                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//                make.left.equalTo(yellowView.snp.left).offset(80.0)
//                make.size.equalTo(CGSize(width: 150, height: 120))
//            }
//
//            didSetupConstraints = true
//        }
//        super.updateViewConstraints()
//    }


}


// SwiftUI 미리보기, preview 작동 opt+cmd+p
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

