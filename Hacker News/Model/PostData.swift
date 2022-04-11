//
//  PostData.swift
//  Hacker News
//
//  Created by leon on 2021/11/29.
//

import Foundation

//Use Decodable protocol so we can decode JSON data into a 'Result' structure
struct Results: Decodable {
    let hits: [Post] // Refer to JSON page, "hits" holds an array of posts.
}

//Define 'Post' objects that we need, and make this structure identifieable

struct Post: Decodable, Identifiable {
//  Use computed properties to make id = objectID to fetch Identifiable protocol.
    var id: String {
        return objectID    }
    let objectID: String//objectID- uniquely identify number of this post.
    let points: Int// how many people upvote
    let title: String
    let url: String?
}
