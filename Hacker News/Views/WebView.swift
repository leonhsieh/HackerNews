//
//  WebView.swift
//  Hacker News
//
//  Created by leon on 2021/11/30.
//

import Foundation
import WebKit
import SwiftUI

// Inherit from UIViewRepresentable to dispaly UIKit view in SwiftUIView
struct WebView: UIViewRepresentable {
    
    let urlString: String?

    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let safeUrl = URL(string: safeString) {
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
}
