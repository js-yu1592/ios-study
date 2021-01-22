//
//  ViewController.swift
//  LottieAnimation
//
//  Created by 유준상 on 2021/01/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Main"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView: AnimationView = {
       let animView = AnimationView(name: "44921-like-animation")
        animView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        self.view.addSubview(animationView)
        animationView.center = view.center
        
        animationView.play{ (finish) in
            print("animation is done")
            
            self.animationView.removeFromSuperview()
        
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }
        
    
       
        
    }


}

