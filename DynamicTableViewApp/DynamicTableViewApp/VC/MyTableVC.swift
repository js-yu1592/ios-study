//
//  ViewController.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/07.
//

import UIKit

class MyTableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let contentArr = [
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        
        "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        
        "Contrary to popular belief, Lorem Ipsum is not simply random text. ",
        
        "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
        
        "Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32.",
        
        "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 셀 리소스 파일 가져오기
        let tableViewCellNib = UINib(nibName: "TableViewCell", bundle: nil)
        
        // 셀에 리소스 등록
        self.tableView.register(tableViewCellNib, forCellReuseIdentifier: "tableViewCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
        
        //아주 중요, 서로 연결하는 부분
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        print("contentArr.count : \(contentArr.count)")
    }

    
}

extension MyTableVC: UITableViewDelegate {
    
}
extension MyTableVC: UITableViewDataSource{
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArr.count
    }
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용하는 셀, 위의 등록한 셀을 알려줌, 자료형을 강제로 tableViewCell을 해야 셀의 라벨에 접근할 수 있음
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        cell.userContentLabel.text = contentArr[indexPath.row]
        
        return cell
    }
}
