//
//  ViewController.swift
//  PagingKitApp
//
//  Created by 유준상 on 2020/12/23.
//

import UIKit
import PagingKit

class ViewController: UIViewController {

    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
    var dataSource = [(menuTitle: "test1", vc: viewController(.red)), (menuTitle: "test2", vc: viewController(.blue)),(menuTitle: "test3", vc: viewController(.yellow))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil),forCellWithReuseIdentifier: "MenuCell")
        
        // 이미 만들어 놓은 타이틀 라벨 형식
        menuViewController.register(type: TitleLabelMenuViewCell.self , forCellWithReuseIdentifier: "titleLabelMenuViewCell")
        
//        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        // 제공하는 언더라인 포커스 뷰 사용
        menuViewController.registerFocusView(view: UnderlineFocusView())
   
        menuViewController.cellAlignment = .center
        
        menuViewController.reloadData()
        contentViewController.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
}

extension ViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
//        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "titleLabelMenuViewCell", for: index) as! TitleLabelMenuViewCell
        cell.titleLabel.text = dataSource[index].menuTitle
        cell.titleLabel.textColor = .black
        return cell
    }
}

extension ViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
}

// 메뉴 컨트롤 델리겟
extension ViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

// 콘텐트 컨트롤 델리겟
extension ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        // 내용이 스크롤되면 메뉴를 스크롤
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
