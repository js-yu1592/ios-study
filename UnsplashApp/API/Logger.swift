//
//  Logger.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/16.
//

import Foundation
import Alamofire

final class Logger : EventMonitor {
    
    let queue = DispatchQueue(label: "Logger")
    
    func requestDidResume(_ request: Request) {
        print("Logger - requestDidResume() called")
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("Logger - didParseResponse() called")
        debugPrint(response)
    }
}
