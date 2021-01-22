//
//  BaseInterceptor.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/16.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
    
    // request() 가 호출될 때, 마지막에 꼭 컴플리션을 호출해야 함(필수)
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("BaseInterceptor - adapt() called")
        
        var request = urlRequest
        
        // json 형태로 에러 등을 받음
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")

        // 공통 파라미터 추가
        var dictionary = [String:String]()
        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")

        do {
            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)
        } catch{
            print(error)
        }
       

        completion(.success(request))
        
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("BaseInterceptor - retry() called")
        
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        
        let data = ["statusCode": statusCode]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil, userInfo: data)
        
        completion(.doNotRetry)
    }
}
