//
//  ContentView.swift
//  Hacker News
//
//  Created by leon on 2021/11/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetWorkManager()
    

    var body: some View {
        NavigationView {

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
        .onAppear {
            self.networkManager.fetData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.light)
    }
}
