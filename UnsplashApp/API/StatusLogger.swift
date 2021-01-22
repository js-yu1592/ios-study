//
//  StatusLogger.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/16.
//

import Foundation
import Alamofire

final class StatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "StatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("StatusLogger - requestDidResume() called")
//        debugPrint(request)
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("StatusLogger - didParseResponse() called")
        
        guard let statusCode = request.response?.statusCode else {
            return
        }
        print("StatusLogger - statusCode : \(statusCode)")
        //debugPrint(response)
    }
}

