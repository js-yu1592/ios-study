//
//  ViewController.swift
//  AdmobApp
//
//  Created by 유준상 on 2020/11/22.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {

    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // In this case, we instantiate the banner with desired ad size.
        // 배너의 사이즈 설정 부분  보통 스마트 배너(kGADAdSizeSmartBannerPortrait)로 설정
        bannerView = GADBannerView(adSize: kGADAdSizeLargeBanner)
        
        // 광고 배너의 아이디를 설정
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        // 광고 로드
        bannerView.load(GADRequest())
        
        bannerView.delegate = self
    }
    // 오토 레이아웃으로 설정하기 위해선 translatesAutoresizingMaskIntoConstanints를 false로 설정해야함
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        // 앵커를 설정하여 오토 레이아웃 설정
        view.addConstraints(
          [NSLayoutConstraint(item: bannerView,
                              attribute: .bottom,
                              relatedBy: .equal,
                              // bottomLayoutGuide -> safeAreaLayoutGuide로 대체하면 안댐
                              toItem: bottomLayoutGuide,
                              attribute: .top,
                              multiplier: 1,
                              constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy: .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
          ])
       }
    
    // Mark - GADBannerViewDelegate method
    
    /// Tells the delegate an ad request loaded an ad. 광고가 로드 된 후에 배너 뷰를 추가하는 것이 계층구조에 있어 안전
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
        
        // 화면에 배너 뷰 추가
        addBannerViewToView(bannerView)
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }


}

