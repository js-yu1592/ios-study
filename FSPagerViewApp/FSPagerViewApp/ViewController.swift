//
//  ViewController.swift
//  FSPagerViewApp
//
//  Created by 유준상 on 2020/12/04.
//

import UIKit
import FSPagerView

class ViewController: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
   
    fileprivate let imageNames = ["1.png", "2.png", "3.png", "4.png"]
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            // 페이저뷰에 cell을 등록
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 페이저에 대한 설정 , 아이템 사이즈
            self.pagerView.itemSize = FSPagerView.automaticSize
            // 무한 스크롤 설정
            self.pagerView.isInfinite = true
            // 자동 스크롤 설정 (4초마다)
            self.pagerView.automaticSlidingInterval = 3.0
            // 트랜스폼 -> 줌아웃으로 설정
            self.pagerView.transformer = FSPagerViewTransformer(type: .zoomOut)
            
        }
    }
    
    @IBOutlet weak var pagerControl: FSPageControl! {
        didSet {
            self.pagerControl.numberOfPages = self.imageNames.count
            // 페이저 컨트롤의 위치를 센터로 설정
            self.pagerControl.contentHorizontalAlignment = .center
            // 아이템 점과 점 사이의 거리를 설정 (16정도)
            self.pagerControl.itemSpacing = 16
            // 페이저 컨트롤 크기 설정(?)
            self.pagerControl.interitemSpacing = 16
            // 색상 변경
            self.pagerControl.setFillColor(#colorLiteral(red: 0, green: 0.4616490602, blue: 0.8919612765, alpha: 1), for: .selected)
            self.pagerControl.setFillColor(.white, for: .normal)
        }
    }
    
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 버튼을 둥글게
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
        
        // 페이저 뷰 사용을 설정
        self.pagerView.dataSource = self // self is FSPagerViewDataSource
        self.pagerView.delegate = self // self is FSPagerViewDelegate
    }

    // MARK: - IBActions
    
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        print("ViewController - onLeftBtnClicked() called")
        //현재 페이지를 -1한걸 인덱스로 넣으면 이전거 즉, 레프트로 이동
        self.pagerControl.currentPage = self.pagerControl.currentPage - 1
        
        self.pagerView.scrollToItem(at: self.pagerControl.currentPage, animated: true)
    }
    
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        print("ViewController - onRightBtnClicked() called")
        
        if(self.pagerControl.currentPage == self.imageNames.count - 1) {
            self.pagerControl.currentPage = 0
        } else {
            self.pagerControl.currentPage = self.pagerControl.currentPage + 1
        }
    
        self.pagerView.scrollToItem(at: self.pagerControl.currentPage, animated: true)
    }
    // MARK: - FSPagerView Data Source
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    // 각 셀에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
//            cell.textLabel?.text = ...
            return cell
    }
    
    //MARK: - FSPagerView Delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pagerControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pagerControl.currentPage = pagerView.currentIndex
    }
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}

