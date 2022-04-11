//
//  NetworkManager.swift
//  Hacker News
//
//  Created by leon on 2021/11/29.
//

import Foundation
import UIKit

//Inorder to pass result from network to ContentView, make NetWorkManager to ObservableObject, which can broadcast its properties to listeners.
//Then go to ContentView, and add a listener.
class NetWorkManager:ObservableObject {

//    Add @Published attribute to create a publisher of this type.
//    @Published is class constrained.
    @Published var posts = [Post]()
    
    func fetData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { Data, response, error in
                if error == nil {
                    //Needs a structure to represent needed properties. Create the PostData.swift and store in it.
                    let decoder = JSONDecoder()
                    
//                    Before using data? from dataTask, have to wrap it first.
                    if let safeData = Data {
                        // After add 'try' key word, also add 'do' and 'catch' to print error
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)//'decode' method Can 'throw' have to use keyword 'try'
//                            Put networking function into main queue
                            DispatchQueue.main.async {
                                self.posts = result.hits //In PostData.swift, "hits" holds an array of posts from the URL page.
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
