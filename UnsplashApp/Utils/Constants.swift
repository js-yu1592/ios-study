//
//  Constants.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/09.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}
enum API {
    static let BASE_URL : String = "https://api.unsplash.com/"
    
    static let CLIENT_ID : String = "f-5fzIIQmyr3aBzCzQy4p1LqNYwfY_rFcaC5I_tV1WI"
}
enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}
