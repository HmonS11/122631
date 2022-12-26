//
//  WebView.swift
//  BookFinderWithSwiftUI_Ex
//
//  Created by wizard on 2022/11/10.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var strURL:String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        if let url = URL(string: strURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(strURL: "https://naver.com")
    }
}
