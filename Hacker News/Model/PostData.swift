//
//  PostData.swift
//  Hacker News
//
//  Created by leon on 2021/11/29.
//

import Foundation

struct Results: Decodable {
    let hits: [Post] 
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID    }
    let objectID: String
    let points: Int// upvote number
    let title: String
    let url: String?
}
