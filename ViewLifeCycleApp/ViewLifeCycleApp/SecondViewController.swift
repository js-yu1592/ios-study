//
//  SecondViewController.swift
//  ViewLifeCycleApp
//
//  Created by 유준상 on 2020/12/10.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("2nd - viewDidLoad() called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("2nd - viewWillAppear() called")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("2nd - viewDidAppear() called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("2nd - viewWillDisappear() called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("2nd - viewDidDisappear() called")
    }
}
