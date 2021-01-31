//
//  MyHeaderCell.swift
//  ExpandableTableView
//
//  Created by 유준상 on 2021/01/31.
//

import Foundation
import UIKit
import ExpyTableView

// MARK: - MyHeaderCell
class MyHeaderCell: UITableViewCell, ExpyTableViewHeaderCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var arrowImgView: UIImageView!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    // 이벤트 전달을 위한 delegate
    weak var delegate: MyCellDelegate?
    
    var sectionIndex: Int = 0 {
        didSet {
            print("MyHeaderCell - sectionIndex didSet() : \(sectionIndex)")
        }
    }
    
    @IBAction func onMySwitchValueChanged(_ sender: UISwitch) {
        print("MyHeaderCell - onMySwitchValueChanged() called / sender : \(sender.isOn)")
        // 델리겟을 통해 스위치의 값이 변경되었다고 알림 -> 뷰컨에서 알게 됨
        delegate?.didSwitchBtnClick(cell: self)
    }
    
    
    // 해당 헤더셀의 상태를 알 수 있음, 다시 사용할지도 알 수 있음
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        print("MyHeaderCell - state : \(state) / cellReuse : \(cellReuse)")

        switch state {
        case .willExpand:
            print("펼쳐질 예정 / willExpand")
            // cell 이 reuse일때는 애니메이션을 할 필요가 없음
            self.arrowDown(animated: !cellReuse)
            self.mySwitch.setOn(true, animated: !cellReuse)
        case .willCollapse:
            print("닫혀질 예정 / willCollapse")
            self.arrowRight(animated: !cellReuse)
            self.mySwitch.setOn(false, animated: !cellReuse)
        case .didExpand:
            print("펼쳐짐 / didExpand")
        case .didCollapse:
            print("닫힘 / didCollapse")
        }
    }
    
    // 화살표 아래로 회전하는 함수
    fileprivate func arrowDown(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0), animations: {
            self.arrowImgView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2))
        })
    }
    
    // 화살표 원래 상태로 돌리기
    fileprivate func arrowRight(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0), animations: {
            self.arrowImgView.transform = CGAffineTransform(rotationAngle: 0)
        })
    }
}
