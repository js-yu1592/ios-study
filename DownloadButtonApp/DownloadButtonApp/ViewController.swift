//
//  ViewController.swift
//  DownloadButtonApp
//
//  Created by 유준상 on 2021/02/24.
//

import UIKit
import Loady
import Alamofire

class ViewController: UIViewController {

    // MARK: - IBOulet properties
    @IBOutlet weak var myDownloadBtn: LoadyButton!
    @IBOutlet weak var uberLikeBtn: LoadyButton!
    @IBOutlet weak var fourPhaseBtn: LoadyFourPhaseButton!
    @IBOutlet weak var downloadingBtn: LoadyButton!
    @IBOutlet weak var indicatorBtn: LoadyButton!
    @IBOutlet weak var androidBtn: LoadyButton!
    @IBOutlet weak var fillingBtn: LoadyButton!
    @IBOutlet weak var circleBtn: LoadyButton!
    @IBOutlet weak var appstoreBtn: LoadyButton!
    
    // 여러 버튼을 한번에 처리하기 위해 배열로 선언
    @IBOutlet var myBtns : [LoadyButton]!
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        myDownloadBtn.layer.cornerRadius = 8
        myBtns.forEach { (btnItem: LoadyButton) in
            btnItem.layer.cornerRadius = 8
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnAnimationSetting()
        
        myDownloadBtn.addTarget(self, action: #selector(onBtnClicked(sender:)), for: .touchUpInside)
        
        myBtns.forEach { (btnItem: LoadyButton) in
            btnItem.addTarget(self, action: #selector(onBtnClicked(sender:)), for: .touchUpInside)
        }
    }
    
    // MARK: - 다운로드 버튼 애니메이션 설정
    func btnAnimationSetting() {
        // 일반 버튼
        myDownloadBtn.setAnimation(LoadyAnimationType.backgroundHighlighter())
        myDownloadBtn.backgroundFillColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        // 우버라이크 버튼
        uberLikeBtn.setAnimation(LoadyAnimationType.topLine())
        
        // 페이즈 버튼 : -일반, 다운로드중, 다운로드 완료, 에러발생 4가지 페이즈
        fourPhaseBtn.loadingColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        let nomalPhase = (title: "대기중..", image: UIImage(systemName: "stopwatch"), background: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        let loadingPhase = (title: "진행중..", image: UIImage(systemName: "paperplane.fill"), background: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        let successPhase = (title: "완료!", image: UIImage(systemName: "checkmark")?.withTintColor(.black).withRenderingMode(.alwaysOriginal), background: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        let errorPhase = (title: "실패🥲", image: UIImage(systemName: "flag.fill"), background: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        
        fourPhaseBtn.setPhases(phases: .init(normalPhase: nomalPhase,
                                             loadingPhase: loadingPhase,
                                             successPhase: successPhase,
                                             errorPhase: errorPhase))
        
        // 다운로딩 버튼
        let downloadingLabel = (title: "다운로드 중입니다...", font: UIFont.boldSystemFont(ofSize: 18), textColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        let percentageLabel = (font: UIFont.boldSystemFont(ofSize: 14), textColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        let downloadedLabel = (title: "다운로드 완료!👍🏻", font: UIFont.boldSystemFont(ofSize: 20), textColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        
        downloadingBtn.setAnimation(LoadyAnimationType.downloading(with: .init(downloadingLabel: downloadingLabel, percentageLabel: percentageLabel, downloadedLabel: downloadedLabel)))
        downloadingBtn.backgroundFillColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        // 인디케이터 버튼
        indicatorBtn.setAnimation(LoadyAnimationType.indicator(with: .init(indicatorViewStyle: .light)))
//        indicatorBtn.setAnimation(LoadyAnimationType.indicator(with: .init(indicatorViewStyle: .black)))
        
        // 안드로이드 버튼
        androidBtn.setAnimation(LoadyAnimationType.android())
        androidBtn.backgroundFillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        androidBtn.loadingColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        // 필링 버튼
        fillingBtn.setAnimation(LoadyAnimationType.backgroundHighlighter())
        fillingBtn.backgroundFillColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        // 서클 버튼, 안드로이드와 서클버튼이 비슷하게 생겼지만, 애니메이션이 다름
        circleBtn.setAnimation(LoadyAnimationType.circleAndTick())
        circleBtn.backgroundFillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        circleBtn.loadingColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        // 앱스토어 버튼
        appstoreBtn.setAnimation(LoadyAnimationType.appstore(with: .init(shrinkFrom: .fromRight)))
        appstoreBtn.pauseImage = UIImage(systemName: "pause")?.withTintColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).withRenderingMode(.alwaysOriginal)
        appstoreBtn.backgroundFillColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        appstoreBtn.loadingColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    // MARK: - 버튼 클릭시 다운로드가 시작됨, 더미 데이터로 다운로드, UI에 대한 설정도 함
    @objc fileprivate func onBtnClicked(sender: LoadyButton) {
        print("ViewController - onBtnClicked() called")
        sender.stopLoading()
        // 들어온 버튼 설정
        sender.startLoading()
        if let button = sender as? LoadyFourPhaseButton {
            button.normalPhase()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                button.loadingPhase()
            }
            
        }
        // 더미 데이터 다운로드 api 주소 http://ipv4.download.thinkbroadband.com/5MB.zip
        let downloadApiUrl = "http://ipv4.download.thinkbroadband.com/5MB.zip"
        
        let progressQueue = DispatchQueue(label: "joon.DownloadButtonApp.progressQueue", qos: .utility)
        
        // 파일이 저장되는 경로 설정
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            // 파일 확장자도 붙일 수 있음
//            let fileURL = documentsURL.appendingPathComponent("image.png")

            // .removePreviousFile :  해당 경로에 파일이 존재한다면 지움, 이 옵션이 없다면 같은 이름의 파일이 존재하기 때문에 다운로드 되지 않음
            // .createIntermediateDirectories : 중간 폴더 만들기
            return (documentsURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        // 다운로드 코드
        AF.download(downloadApiUrl, to: destination)
            .downloadProgress(queue: progressQueue) { progress in
                print("Download Progress: \(progress.fractionCompleted)")
                
                let loadingPercent = progress.fractionCompleted * 100
                print("loadingPercent : \(loadingPercent)")
                
                // UI의 같은 경우에 progressQueue가 아닌 메인스레드에서 작동하므로 설정을 해줘야 UI의 형태가 변함
                DispatchQueue.main.async {
                    sender.update(percent: CGFloat(loadingPercent))
                }
                
        }.responseURL { (response) in
            debugPrint(response)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sender.stopLoading()
                // fourPhase버튼같은 경우 스탑로딩방식이 다름
                if let button = sender as? LoadyFourPhaseButton {
                    button.successPhase()
                }
            }
            
        }
    }

}

