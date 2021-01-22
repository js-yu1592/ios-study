//
//  ViewController.swift
//  AutoLayoutCode01
//
//  Created by 유준상 on 2021/01/14.
//

import UIKit

class ViewController: UIViewController {

    // closure 로 뷰를 설정
    var mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // cornerRadius 자리를 잘잡기위해 true 설정

        return view
    }()
    
    var myThirdView: MyCircleView = {
        let circleView = MyCircleView()
        circleView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myFirstView = UIView()
        // 코드로 오토레이아웃을 잡을때 꼭 해줘야함
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        // x축, y축 위치 설정
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        // 뷰의 가로, 세로 크기 설정
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor,constant: 10),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 50),
        ])
        
        // 위와 같은 표현, isActive = true를 써주지 않아도 됌
//        mySecondView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        mySecondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor,constant: 10).isActive = true
//        mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20).isActive = true
        
        self.view.addSubview(myThirdView)
        NSLayoutConstraint.activate([
//            myThirdView.widthAnchor.constraint(equalToConstant: 100),
//            myThirdView.heightAnchor.constraint(equalToConstant: 100),
            myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5), // 1.5배
            myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5),
            myThirdView.leadingAnchor.constraint(equalTo: mySecondView.leadingAnchor, constant: 100),
            myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 30)
        ])
        
    }


}
// SwiftUI
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
    }
    // make ui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("iPhone 11")
    } // opt + cmd + p preview 작동
}
#endif
