//
//  CircleButton.swift
//  StackViewApp
//
//  Created by 유준상 on 2021/01/12.
//

import Foundation
import UIKit

// 인터페이스 빌더에서 디자인으로 확인 가능하게끔 IBDesignable
@IBDesignable
class CircleButton: UIButton {
    // 인터페이스 빌더에 필드를 만듬, IBInspectable 인스펙터 패널에서 사용될 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
