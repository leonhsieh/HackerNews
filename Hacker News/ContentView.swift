//
//  ContentView.swift
//  Hacker News
//
//  Created by leon on 2021/11/24.
//

import SwiftUI

struct ContentView: View {
    
    //    Add a listener obejct and initialized from NetWorkManager,
    //    and mark it as @ObservedObject wrapper to subscribe updates from NetWorkManager.
    //    When NetWorkManager updates, will trigger @ObservedObject, and we can use networkManager.post property to update our views.
    @ObservedObject var networkManager = NetWorkManager()
    

    var body: some View {
        NavigationView {
            //            Use List(<#T##data: RandomAccessCollection##RandomAccessCollection#>, rowContent: <#T##(Identifiable) -> View#>) and turn into trailing closure.
            //            Data is array of posts, rowContent is goting to take a closure, which inputs identifiable data and output a view.
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("Hacker News")
        }
        //        Add .onAppear(perform: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>) method to NavigationVier and pass a function in it.
        //        Similar to ViewDidLoad in UIKits, onAppear method will perform the function insdie when the view appears on screen.
        .onAppear {
            self.networkManager.fetData()
        }
    }
}


//A Demo of Identifiable protocol, which need a id parameter, impelement in PostData.
//struct Post: Identifiable {
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "One"),
//    Post(id: "2", title: "Two"),
//    Post(id: "3", title: "Three")
//]


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.light)
    }
}
