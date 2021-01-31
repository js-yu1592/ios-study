//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by 유준상 on 2021/01/30.
//

import UIKit
import ExpyTableView

class ViewController: UIViewController, MyCellDelegate{
    
   
    @IBOutlet weak var myExpandableTableView: ExpyTableView!
    
    
    // 테이블 뷰의 데이터, 2차원 배열로 섹션안의 row에 들어갈 data
    let contentArray = [
        ["섹션1 - 하나", "섹션1 - 둘"],
        ["섹션2 - 하나", "섹션2 - 둘", "섹션2 - 셋"],
        ["섹션3 - 하나", "섹션3 - 둘"],
        ["섹션4 - 하나"],
        ["섹션5 - 하나", "섹션5 - 둘"],
        ["섹션6 - 하나"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myExpandableTableView.dataSource = self
        myExpandableTableView.delegate = self
    }
    
    
    // MARK: - MyCellDelegate method
    func didSwitchBtnClick(cell: MyHeaderCell) {
        print("ViewController - didSwitchBtnClick() called / cell.sectionIndex : \(cell.sectionIndex)")
        
        switch cell.mySwitch.isOn {
        case true:
            myExpandableTableView.expand(cell.sectionIndex)
        case false:
            myExpandableTableView.collapse(cell.sectionIndex)
        }
    }

}

extension ViewController: ExpyTableViewDelegate {
    // MARK: - ExpyTableView Delegate
    // 열리고 닫히고 상태가 변경될 때
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        // 섹션정보도 알 수 있음
        print("changeForSection : \(section)")
        
        switch state {
        case .willExpand:
            print("펼쳐질 예정 / willExpand")
        case .willCollapse:
            print("닫혀질 예정 / willCollapse")
        case .didExpand:
            print("펼쳐짐 / didExpand")
        case .didCollapse:
            print("닫힘 / didCollapse")
        }
    }
}
extension ViewController: ExpyTableViewDataSource {
    // MARK: - ExpyTableView DataSource
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true // 섹션에 따라 설정 가능 / true로 설정하면 펼칠 수 있음, false면 펼칠 수 없음
    }
    // 펼치는 섹션 즉, 헤더셀 설정
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyHeaderCell") as! MyHeaderCell
        cell.titleLabel.text = "섹션 \(section + 1) 입니다."
        let bgView = UIView()
        bgView.backgroundColor = .white
        cell.selectedBackgroundView = bgView
        
        cell.sectionIndex = section
        // 스위치 버튼 클릭 처리를 위한 MyCellDelegate 연결
        cell.delegate = self
        return cell
    }
    
    // 각 섹션마다 들어갈 row의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray[section].count + 1
    }
    
    // 각 섹션을 펼쳐졌을때 셀을 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MyDetailCell을 연결해서 reuse할 수 있도록 함
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDetailCell") as! MyDetailCell
        // 해당 index 섹션의 index row값을 셀에 넣음, -1 해준 이유는 위에 +1을 해줬기 때문에
        cell.titleLabel.text = (contentArray[indexPath.section])[indexPath.row - 1]
        return cell
    }
    // 섹션의 갯수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 상태를 해제해주기 위해 사용
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
