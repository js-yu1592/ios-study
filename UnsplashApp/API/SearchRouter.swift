//
//  SearchRouter.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/16.
//

import Foundation
import Alamofire

// 검색 관련 API 호출
enum SearchRouter : URLRequestConvertible {
    case searchPhotos(term: String)
    case searchUsers(term: String)
    
    var baseURL: URL { // 클로져, return 의 값이 baseURL이 되는 것
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
        //3가지 방법
//        return .get
        
        switch self {
        case .searchPhotos, .searchUsers:
            return .get
        }
        
//        switch self {
//        case .searchPhotos:
//            return .get
//        case .searchUsers:
//            return .get
//        }
    }
    
    var endPoint: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    // 공통 파라미터 추가
    var parameters : [String: String] {
        switch self {
        case let .searchPhotos(term), let .searchUsers(term):
            return ["query" : term]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("SearchRouter - asURLRequest() called / url : \(url)")
        
        var request = URLRequest(url: url)
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request) // 아까는 do try를 해야하지만 위에 throws가 있기때문에 try만 해도 됨
        
        return request
    }
}
