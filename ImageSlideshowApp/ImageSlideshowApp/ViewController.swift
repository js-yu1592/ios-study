//
//  ViewController.swift
//  ImageSlideshowApp
//
//  Created by 유준상 on 2021/01/25.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {

    @IBOutlet var myImageSlide : ImageSlideshow!
    
    // MARK: - ImageResources
    let puppyImageResources = [
        // 이미지가 있다면 이런식으로 넣어도 됨
//        ImageSource(image: UIImage(named: "myImage"))!
        
        // placeholder 는 대체할 이미지
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1591160690555-5debfba289f0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cHVwcHl8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1600804340584-c7db2eacf0bf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8cHVwcHl8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1565708097881-bbf4ecf47cc1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHB1cHB5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1610244130620-fd348aa7854e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fHB1cHB5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1579909717133-8924df7e26aa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzB8fHB1cHB5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!
    ]
    
    let catImageResources = [
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGNhdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1536590158209-e9d615d525e4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGNhdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1517331156700-3c241d2b4d83?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNhdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1518288774672-b94e808873ff?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fGNhdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!,
        KingfisherSource(urlString: "https://images.unsplash.com/photo-1487300001871-12053913095d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjl8fGNhdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60", placeholder: UIImage(systemName: "photo")?.withTintColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),renderingMode: .alwaysOriginal), options: .none)!
    ]
    
    // MARK: - Constants
    let mySecondImageSlide : ImageSlideshow = {
       let imageSlide = ImageSlideshow()
        imageSlide.contentScaleMode = .scaleAspectFill
        imageSlide.slideshowInterval = 2
        // 터치가 가능한지 설정
        imageSlide.isUserInteractionEnabled = true
        imageSlide.translatesAutoresizingMaskIntoConstraints = false
        return imageSlide
    }()
    
    let labelBgView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4595226712, green: 0.4595226712, blue: 0.4595226712, alpha: 0.41)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myLabelIndicator: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - loadView() / imageSlide를 코드로 구현
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        
        let labelPageIndicator = LabelPageIndicator() // 2/10 이런식으로 페이지 indicator가 나옴
        labelPageIndicator.textColor = .white
        
        mySecondImageSlide.pageIndicator = labelPageIndicator // 두번째 이미지슬라이드에 indicator를 라벨로 바꿈
        mySecondImageSlide.setImageInputs(puppyImageResources)
        
        self.view.addSubview(mySecondImageSlide)
        
        NSLayoutConstraint.activate([
            mySecondImageSlide.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mySecondImageSlide.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mySecondImageSlide.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mySecondImageSlide.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        mySecondImageSlide.addSubview(labelBgView) // 라벨 배경을 추가함, 라벨 배경을 나중에 추가했기 때문에 라벨 배경이 labelPageIndicator를 덮게 됨, 밑에 Debug View Hierarchy를 누르면 뷰의 계층을 볼수있음
        
        NSLayoutConstraint.activate([
            labelBgView.centerXAnchor.constraint(equalTo: labelPageIndicator.centerXAnchor),
            labelBgView.centerYAnchor.constraint(equalTo: labelPageIndicator.centerYAnchor),
            labelBgView.widthAnchor.constraint(equalTo: labelPageIndicator.widthAnchor, multiplier: 1.2),
            labelBgView.heightAnchor.constraint(equalTo: labelPageIndicator.heightAnchor, multiplier: 1.2)
        ])
        
        // labelBgView가 labelPageIndicator를 덮고있기 때문에 labelPageIndicator를 맨 앞으로 꺼냄
        mySecondImageSlide.bringSubviewToFront(labelPageIndicator)
        
        print("UIDevice.current.hasNotch : \(UIDevice.current.hasNotch)")
        
        // 노치 디자인이 아닌 아이폰(se2,se1,8,7,... 같은)을 실행했을때 labelPageIndicator가 화면밖으로 나가버림, 이런것도 신경써야함
        mySecondImageSlide.pageIndicatorPosition = .init(horizontal: .right(padding: 20), vertical: .customBottom(padding: UIDevice.current.hasNotch ? -10 : 20))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        mySecondImageSlide.addGestureRecognizer(tapGesture) // 이미지 슬라이드를 탭했을때 이벤트 발생
        
    }
    
    // MARK: - viewDidLoad() / imageSlide를 storyboard로 구현
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myImageSlide.setImageInputs(catImageResources)
        myImageSlide.contentScaleMode = .scaleAspectFill
        myImageSlide.slideshowInterval = 2
        myImageSlide.zoomEnabled = true
        
        // 인디케이터의 위치를 변경함
//        myImageSlide.pageIndicatorPosition = .init(horizontal: .left(padding: 10), vertical: .bottom)
    }

    // MARK: - TapGesture 함수
    @objc func didTap(_ sender: UITapGestureRecognizer? = nil){
        print("ViewController - didTap() called")
        let fullScreenController = mySecondImageSlide.presentFullScreenController(from: self, completion: nil) // presentFullScreenController()는 api 제공
        fullScreenController.slideshow.pageIndicator = LabelPageIndicator() // 풀스크린 상태에서 슬라이드쇼, 슬라이드쇼의 indicator를 라벨형태로 보여줌
        
        fullScreenController.view.addSubview(myLabelIndicator) // 아까 만든 labelIndicator 사용
        myLabelIndicator.topAnchor.constraint(equalTo: fullScreenController.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myLabelIndicator.centerXAnchor.constraint(equalTo: fullScreenController.view.centerXAnchor).isActive = true
        // 페이지 값은 0부터 시작되기 때문에 +1해줌
        let currentPageString = String(fullScreenController.slideshow.currentPage + 1)
        myLabelIndicator.text = currentPageString + "/ \(fullScreenController.slideshow.images.count)"
        
        // 델리겟을 통해 현재 페이지의 값을 알 수 있음
        fullScreenController.slideshow.delegate = self
    }

}

// MARK: - ImageSlideshowDelegate
extension ViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("ViewController - imageSlideshow() called / page : \(page)")
        myLabelIndicator.text = String(page + 1) + " / " + String(imageSlideshow.images.count)
    }
}

// MARK: - hasNotch check
extension UIDevice { // 노치가 있는지 없는지 확인
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            if UIApplication.shared.windows.count == 0 { return false } // 노치가 아님
            let top = UIApplication.shared.windows[0].safeAreaInsets.top
            return top > 20 // 노치가 있다는 뜻
        } else {
            return false
        }
    }
}

