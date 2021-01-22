//
//  MyCollectionVC.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/17.
//

import Foundation
import UIKit

class MyCollectionVC: UIViewController {
    
    fileprivate let systemImageNameArray = [
            "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
        ]
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MyCollectionVC - viewDidLoad() called")
        
        myCollectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // 사용할 콜렉션뷰 셀을 등록
//        let collectionViewCellNib = UINib(nibName: "MyCustomCollectionViewCell", bundle: nil)
        // 닙 파일을 가져온다
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
    
        // 가져온 닙파일로 콜렉션뷰에 셀로 등록
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
//        // 콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다.
        self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFitst()
        
    }
    
    // 세그먼트를 통해 레이아웃을 변경함
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        print("MyCollectionVC - onCollectionViewTypeChanged() called / sender.selectedSegmentIndex : \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            // 테이블뷰 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFitst()
        case 1:
            // 2x2 그리드 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForSecond()
        case 2:
            // 3x3 그리드 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForThird()
        default:
            break
        }
    }
    
    
}
// MARK: - Compositional Layout 관련
extension MyCollectionVC {
    // 콤포지셔널 레이아웃 설정 (section -> group -> item 이 있음)
    fileprivate func createCompositionalLayoutForFitst() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴, 변환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야 함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute는 고정값, estimated는 추측, fraction은 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            // 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경할 부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹사이즈로 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            // 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤할 수 있음
//            section.orthogonalScrollingBehavior = .groupPaging // 그룹마다 페이징이 됨
            
            // 세션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴, 변환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야 함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute는 고정값, estimated는 추측, fraction은 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            // 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경할 부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/2)
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹사이즈로 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            // 변경할 부분
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤할 수 있음
//            section.orthogonalScrollingBehavior = .groupPaging // 그룹마다 페이징이 됨
            
            // 세션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴, 변환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야 함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute는 고정값, estimated는 추측, fraction은 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            // 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경할 부분, 그룹의 높이를 조절함
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹사이즈로 그룹 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            
            // 변경할 부분, count의 갯수를 변경하면서 그리드의 형태를 변형할 수 있음
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤할 수 있음
//            section.orthogonalScrollingBehavior = .groupPaging // 그룹마다 페이징이 됨
            
            // 세션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
}
// MARK: - Delegate, DataSource
// delegate - 액션과 관련된 것들
extension MyCollectionVC: UICollectionViewDelegate {
    
}

// 데이터 소스 설정 - 데이터와 관련된 것들
extension MyCollectionVC: UICollectionViewDataSource {
    // 각 세션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    // 각 콜렉션 뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 클래스 명을 string으로 가져오는 방법, describing: 객체의 인스턴스 명을 가져오는 방법
//        let cellId = String(describing: MyCollectionViewCell.self)
//        print("cellId : \(cellId)")
        
        // cell 의 인스턴스
        // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCustomCollectionViewCell.self), for: indexPath) as! MyCustomCollectionViewCell
        
        cell.imgName = self.systemImageNameArray[indexPath.item]
        
       
        // 데이터에 따른 셀 UI 변경은 MyCollectionVC 에서 해도 되고 MyCollectionViewCell에서 설정해도 됨
        
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        cell.contentView.layer.cornerRadius = 8
//        cell.contentView.layer.borderWidth = 1
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        // 이미지에 대한 설정
//        cell.profileImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
//        // 라벨 설정
//        cell.profileLabel.text = self.systemImageNameArray[indexPath.item]
        
        return cell
    }
    
    
}
