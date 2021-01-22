//
//  ViewController.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/09.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: BaseVC, UISearchBarDelegate, UIGestureRecognizerDelegate {
    // MARK: - IBOulet
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    
    var keyboardDismissTapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    var fullUrl: String = ""
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() { // 뷰 컨트롤러가 메모리에 로드 되고 난 후 호출
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeVC - viewDidLoad() called")
        // ui 설정, viewDidLoad() 가 너무 길어져서 함수를 사용해 실행
        
        self.config()
        
    }
    
    
    // 화면이 넘어가기전에 준비됨 segue의 identifier를 알 수 있음
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier : \(segue.identifier)")

        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC: // Constants에서 변수를 저장해둠 "segue.identifier" 내용으로 작성해도 됨
            // 다음 화면의 뷰 컨트롤러를 가져온다
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue = self.searchBar.text else { // 예외를 처리할때 guard else구문을 사용, guard 후 조건값이 false이면 else문 실행
                return
            }

            nextVC.vcTitle = userInputValue + " 💩"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            let nextVC = segue.destination as! PhotoCollectionVC
            guard let userInputValue = self.searchBar.text else {
                return
            }

            nextVC.vcTitle = userInputValue + " 👻"
            print("fullUrl : \(self.fullUrl)")
            //nextVC.photoUrl = self.fullUrl
        default:
            print("default")
        }
    }
    
   // 화면이 완전히 나타났을때 호출
    override func viewDidAppear(_ animated: Bool) {
        self.searchBar.becomeFirstResponder() // 포커싱
    }
    
    // MARK: - fileprivate methods
    fileprivate func config() {
        // ui 설정
        self.searchBtn.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        
        self.searchBar.delegate = self
        
        self.keyboardDismissTapGesture.delegate = self
        
        self.view.addGestureRecognizer(keyboardDismissTapGesture)
       
        
    }
    
    //화면 이동 함수
    fileprivate func pushVC() {
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        case 1:
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC"
        default:
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        }
        
        // 화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
        
    }
    
    
    @objc func keyboardWillShowHandle(notification: NSNotification){
        print("HomeVC - keyboardWillShowHandle() called")
        //(notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue 에 값이 있으면 keyboardSize에 값을 넣음
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            print("keyboardSize Height: \(keyboardSize.height)")
            print("searchBtn.frame.origin.y : \(searchBtn.frame.origin.y)")
            
            // viewController에서의 높이는 위에서 아래로 잼
            if(keyboardSize.height < searchBtn.frame.origin.y){
                print("키보드가 버튼을 덮었음")
                let distance = keyboardSize.height - searchBtn.frame.origin.y
                print("이만큼 덮음 : \(distance)")
                
                self.view.frame.origin.y = distance
            }
        }
        
        //키보드 사이즈 가져오기
//        self.view.frame.origin.y = -50
        
    }
    @objc func keyboardWillHideHandle(){
        print("HomeVC - keyboardWillHideHandle() called")
        
        self.view.frame.origin.y = 0
    }
    // 키보드가 올라가는 이벤트를 받는 처리, 뷰가 나타날거라고 컨트롤러에게 알림
    // viewDidLoad는 앱의 초기화할때만 호출하지만, viewWillAppear는 다른화면을 다녀오는 상황에도 호출됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        // 키보드 노티피케이션 등록, 노티피케이션을 받음
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    // 뷰가 사라질거라고 컨트롤러에게 알림
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        // 키보드 노티피케이션 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // MARK: - IBActions
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) { // segmented control 타이틀 설정
        var searchBarTitle = ""
        print("HomeVC - searchFilterValueChanged() called / index : \(sender.selectedSegmentIndex) ") // selectedSegmentIndex를 제공
        
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        self.searchBar.becomeFirstResponder() // 포커싱
//        self.searchBar.resignFirstResponder() // 포커싱 해제
    }
    
    @IBAction func onSearchBtnClicked(_ sender: UIButton) { // 검색 버튼을 눌렀을 때 화면이동
        print("HomeVC - onSearchBtnClicked() called / index : \(searchFilterSegment.selectedSegmentIndex)")
        
//        let url = API.BASE_URL + "search/photos"
        
        
        guard let userInput = self.searchBar.text else {
            return
        }
//        let parameters = ["query" : userInput, "client_id" : API.CLIENT_ID]
        
//        AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseJSON(completionHandler: {
//            response in debugPrint(response)
//        })
        var urlToCall : URLRequestConvertible?
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            urlToCall = SearchRouter.searchPhotos(term: userInput)
            AlamofileManager
                .shared
                .getPhotos(searchTerm: userInput, completion: { [weak self] result in
                        // 클로져 ARC
                        // ARC 란 자동으로 메모리 사용수를 계산해주는 것, iOS 에서는 ARC를 지원
                        // 클로져에서 사용하는 self는 메모리 카운트를 증가시킴 -> weak self를 통해 메모리에 계속 잡아두고 있는 것을 방지해줌
                        // 대신 self 키워드 사용 전 guard else 구문을 써줘야함
                    guard let self = self else {return}
                    switch result{
                    case .success(let fetchedPhtos) :
                        print("HomeVC - getPhotos.success - fetchedPhotos.count : \(fetchedPhtos.count)")
                        if let photoRVC = self.storyboard?.instantiateViewController(withIdentifier: "BaseVC") as? BaseVC {
                            photoRVC.photoUrl = fetchedPhtos[0].thumbnail

                            self.navigationController?.pushViewController(photoRVC, animated: true)
                        }
                        
                        
                    case .failure(let error) :
                        print("HomeVC - getPhtos.failure - error : \(error.rawValue)")
                        self.view.makeToast(error.rawValue, duration: 2.0, position: .center)
                    }
            })
        case 1:
            urlToCall = SearchRouter.searchUsers(term: userInput)
            AlamofileManager
                .shared
                .getPhotos(searchTerm: userInput, completion: { [weak self] result in
                        // 클로져 ARC
                        // ARC 란 자동으로 메모리 사용수를 계산해주는 것, iOS 에서는 ARC를 지원
                        // 클로져에서 사용하는 self는 메모리 카운트를 증가시킴 -> weak self를 통해 메모리에 계속 잡아두고 있는 것을 방지해줌
                        // 대신 self 키워드 사용 전 guard else 구문을 써줘야함
                    guard let self = self else {return}
                    switch result{
                    case .success(let fetchedPhtos) :
                        print("HomeVC - getPhotos.success - fetchedPhotos.count : \(fetchedPhtos.count)")
                        if let photoRVC = self.storyboard?.instantiateViewController(withIdentifier: "BaseVC") as? BaseVC {
                            photoRVC.photoUrl = fetchedPhtos[0].thumbnail

                            self.navigationController?.pushViewController(photoRVC, animated: true)
                        }
                        
                        
                    case .failure(let error) :
                        print("HomeVC - getPhtos.failure - error : \(error.rawValue)")
                        self.view.makeToast(error.rawValue, duration: 2.0, position: .center)
                    }
            })
        default:
            print("default")
        }
        
//        if let urlConvertible = urlToCall {
//            AlamofileManager
//                .shared
//                .session
//                .request(urlConvertible)
//                .validate(statusCode: 200...400)  // 오류 발생 시 retry가 호출됨, 200~ 400 까지만 허용
//                .responseJSON(completionHandler: { response in
//                    debugPrint(response)
//            })
//        }
       
        // 화면으로 이동
        //pushVC()
    }

    
    // MARK: - UISearchBarDelegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // 자판에 있는 검색을 눌렀을 때 화면 이동
        print("HomeVC - searchBarSearchButtonClicked() called")
        
        // 언래핑
        guard let userInputString = searchBar.text else { return }
        if userInputString.isEmpty {
            self.view.makeToast("😅검색 키워드를 입력해주세요.😅", duration: 2.0, position: .center) //토스트 스위프트 API
        } else { // 사용자 입력 값이 비어있지 않다면 화면이동
            pushVC()
            searchBar.resignFirstResponder() // 포커싱해제
        }
    }
    // 서치바의 searchText를 제공하는 함수
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() called / searchText : \(searchText)")
        
        // 사용자가 입력한 값이 없을 때
        if (searchText.isEmpty) {
            self.searchBtn.isHidden = true
            //서치바에 x를 눌렀을때 포커싱이 해제가 안됨. 딜레이를 줘서 포커싱이 해제되도록 해줌
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                // 포커싱 해제
                searchBar.resignFirstResponder()
            })
            
        } else {
            self.searchBtn.isHidden = false
        }
        
    }
    // 서치바의 searchText가 바뀌는거를 체크해주는 메소드, 카운트를 통해 글자 제한을 둘 수 있음
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextCount : Int = searchBar.text?.appending(text).count ?? 0 // 값이 없으면 0으로 디폴트
        
        print("shouldChangeTextIn : \(searchBar.text?.appending(text).count)")
        
        if (inputTextCount >= 12){
            self.view.makeToast("😅12자 까지만 입력 가능합니다.😅", duration: 2.0, position: .center)
            // 여기에 return false를 넣으려 했지만 이렇게 되면 11자가 들어가고 12자부터는 false처리 되므로 입력이 안됨
        }
     
        return inputTextCount <= 12
    }
    
    // MARK: - UIGestureRecognizerDelegate
    // 터치 제스처를 통해 키보드 이벤트를 조정
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        // 터치로 들어온 뷰가 세그먼트 컨트롤이면 ,
        if(touch.view?.isDescendant(of: searchFilterSegment) == true){
            print("서치필터 세그먼트 touched")
            return false
        } else if(touch.view?.isDescendant(of: searchBar) == true){
            print("서치바 touched")
            return false
        } else{
            view.endEditing(true)
            print("화면 touched")
            return true
        }
    }
}

