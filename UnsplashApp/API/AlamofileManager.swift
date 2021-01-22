//
//  AlamofileManager.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

final class AlamofileManager {
    
    // 싱글턴 적용
    static let shared = AlamofileManager()
    
    // 인터셉터 - 중간에 공통 파라미터를 넣거나 토큰을 넣을 때, 인터셉터를 통해 값을 가져옴
    let interceptors = Interceptor(interceptors:
                                    [
                                        BaseInterceptor()
                                    ])
    
    // 로거 설정
    let monitors = [Logger(), StatusLogger()] as [EventMonitor]
    
    // 세션 설정
    var session: Session
    
    static var photoArray = [Photo]()
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
    func getPhotos(searchTerm userInput: String, completion: @escaping (Result<[Photo], MyError>) -> Void){
        
        print("AlamofileManager - getPhotos() called : \(userInput)")
        self.session
            .request(SearchRouter.searchPhotos(term: userInput))
            .validate(statusCode: 200...400)  // 오류 발생 시 retry가 호출됨, 200~ 400 까지만 허용
            .responseJSON(completionHandler: { response in
                
                guard let responseValue = response.value else{ return }
                
                let responseJson = JSON(responseValue)
                
                let jsonArray = responseJson["results"]
                
                var photos = [Photo]()
                
                print("jsonArray.count : \(jsonArray.count)")
                
                for (index, subJson) : (String, JSON) in jsonArray {
                    print("index : \(index), subJson : \(subJson)")
                    
                    // 데이터 파싱
//                    let thumbnail = subJson["urls"]["thumb"].string ?? ""
//                    let username = subJson["user"]["username"].string ?? ""
//                    let createdAt = subJson["created_at"].string ?? ""
                    
                    guard let thumbnail = subJson["urls"]["full"].string,
                          let username = subJson["user"]["username"].string,
                          let createdAt = subJson["created_at"].string else { return }
                    
                    let likesCount = subJson["likes"].intValue
                    
                    let photoItem = Photo(thumbnail: thumbnail, username: username, likesCount: likesCount, createdAt: createdAt)
                    // 배열에 넣고
                    photos.append(photoItem)
                    //print("alamofilemanager - photo thumbnail url : \(photos[0].thumbnail)")
                }
                
                if photos.count > 0 {
                    completion(.success(photos))
                } else {
                    completion(.failure(.noContent))
                }
                
            })
    }
}
