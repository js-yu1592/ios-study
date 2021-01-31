//
//  MyCellDelegate.swift
//  ExpandableTableView
//
//  Created by 유준상 on 2021/01/31.
//

import Foundation
import UIKit

// 이벤트 전달을 위한 delegate
protocol MyCellDelegate: class {
    func didSwitchBtnClick(cell: MyHeaderCell)
}
