//
//  ViewController.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/07.
//

import UIKit

// 모델이 필요, 섹션
enum Section {
    // 아이템
    case feed, post, board
}

// 클래스로 구성, diffable datasource는 값이 유일해야하기 때문에 Hashable 프로토콜 적용
class Feed: Hashable {
    
    let uuid: UUID = UUID()
    var content: String
    init(content: String) {
        self.content = content
    }
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.uuid == rhs.uuid
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
}

// 구조체로 구성, 구조체는 값타입이기 때문에 위와 같이 안해도 됨
struct Post: Hashable {
    var content: String
}

class ViewController: UIViewController {
    // 1. 테이블뷰
    @IBOutlet weak var tableView: UITableView!
    
    // 2. 데이터 소스 - UITableViewDataSource delegate을 대체
    var dataSource: UITableViewDiffableDataSource<Section, Feed>!
    
    // 3. 스냅샷 - 현재의 데이터 상태
    var snapshot: NSDiffableDataSourceSnapshot<Section,Feed>!
    
    let feedArr = [
        Feed(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        
        Feed(content: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        
        Feed(content:"It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        
        Feed(content:"Contrary to popular belief, Lorem Ipsum is not simply random text. "),
        
        Feed(content:"It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."),
        
        Feed(content:"Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32."),
        
        Feed(content: "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")
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
//        self.tableView.dataSource = self
        
        print("feedArr.count : \(feedArr.count)")
        
        // MARK: - 데이터 소스 설정, 기존의 UITableViewDataSource를 DiffableSource로 대체
        // 연결할 테이블뷰, 셀 프로바이더 = 보여줄 셀
        dataSource = UITableViewDiffableDataSource<Section, Feed>(tableView: self.tableView, cellProvider: {
            (tableView: UITableView, indexpath: IndexPath, identifier: Feed) -> UITableViewCell? in
            
            // cell 클래스 연결
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexpath) as! TableViewCell
            
            return cell
        })
        
        // 데이터 소스의 현재 스냅샷을 만든다
        snapshot = NSDiffableDataSourceSnapshot<Section, Feed>()
        
        // 섹션을 추가
        snapshot.appendSections([.feed])
        // 방금 추가한 섹션에 아이템을 넣기
        snapshot.appendItems(feedArr, toSection: .feed)
        
        // 현재 스냅샷을 화면에 보여준다
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }

    
}

extension ViewController: UITableViewDelegate {
    
}
//extension ViewController: UITableViewDataSource{
//    // 테이블 뷰 셀의 갯수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.feedArr.count
//    }
//    // 각 셀에 대한 설정
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 재사용하는 셀, 위의 등록한 셀을 알려줌, 자료형을 강제로 tableViewCell을 해야 셀의 라벨에 접근할 수 있음
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
//
//        cell.userContentLabel.text = feedArr[indexPath.row]
//
//        return cell
//    }
//}
