//
//  ViewController.swift
//  PhotoApp
//
//  Created by 유준상 on 2020/11/30.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileChangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        // IBAction을 사용하지 않고 직접 onClicked() 메소드를 구현, touchUpInside는 버튼 안쪽이 클릭되었을 때를 뜻함
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }

    // 프사 변경 버튼이 클릭되었을 때, Image Picker가 나오게 함
    @objc fileprivate func onProfileChangeBtnClicked() {
        print("ViewController - onProfileChangeBtnClicked() called")
        // 카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        
        let picker = YPImagePicker(configuration: config)
        
        // 사진이 선택되었을때, completion block이 실행됨, completion block 에서는 self를 써줘야 함
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                //프사 이미지 변경
                self.profileImage.image = photo.image
            }
            // picker 창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        // 사진 선택 창 보여주기
        present(picker, animated: true, completion: nil)
    }

}

