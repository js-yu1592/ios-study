//
//  ViewController.swift
//  ViewLifeCycleApp
//
//  Created by 유준상 on 2020/12/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1st - viewDidLoad() called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("1st - viewWillAppear() called")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("1st - viewDidAppear() called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("1st - viewWillDisappear() called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("1st - viewDidDisappear() called")
    }
    

// 결과 : 뷰 라이프 사이클은 viewDidLoad -> viewWillAppear -> viewDidAppear -> viewWillDisapear -> viewDidDisappear 이며, 해당 화면이 꺼지면 다음 화면이 viewDidAppear하기 전에 viewDidDisppear를 실행함, 즉, 전에 있던 화면이 완전히 사라진 후 다음 화면이 완전히 켜짐
}

