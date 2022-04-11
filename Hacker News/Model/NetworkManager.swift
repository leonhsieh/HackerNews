//
//  NetworkManager.swift
//  Hacker News
//
//  Created by leon on 2021/11/29.
//

import Foundation
import UIKit


//1. Make NetWorkManager as an ObservableObject, which can broadcast its properties to listeners.
//2. Pass result from network to ContentView
//3. Add a listener in ContentView
class NetWorkManager:ObservableObject {

    @Published var posts = [Post]()
    
    func fetData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { Data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeData = Data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
