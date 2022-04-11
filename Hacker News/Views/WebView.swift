//
//  WebView.swift
//  Hacker News
//
//  Created by leon on 2021/11/30.
//

import Foundation
import WebKit
import SwiftUI

// UIViewRepresentable can dispaly UIKit view in SwiftUIView
struct WebView: UIViewRepresentable {
    
    let urlString: String?

    //       Insert 'makeUIView', 'updateUIView' to get ridoff warning
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
//        render uiview from url
        if let safeString = urlString {
            if let safeUrl = URL(string: safeString) {
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
}
