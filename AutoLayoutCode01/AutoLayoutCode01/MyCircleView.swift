//
//  MyCircleView.swift
//  AutoLayoutCode01
//
//  Created by 유준상 on 2021/01/14.
//

import Foundation
import UIKit

class MyCircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("MyCircleView - layoutSubviews() called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
