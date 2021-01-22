//
//  Photo.swift
//  UnsplashApp
//
//  Created by 유준상 on 2020/12/18.
//

import Foundation

struct Photo :Codable {
    var thumbnail: String
    var username: String
    var likesCount: Int
    var createdAt: String
}
