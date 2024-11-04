//
//  ButtonText.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

struct ButtonText: View {
    let text: String
    var body: some View {
        Image("buttonV")
            .resizable()
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 60)
            .overlay {
                StrokeText(text: text, width: 1, color: .black)
                    .font(.custom(Font.happyChicken, size: 30))
                    .foregroundStyle(.white)
            }
            
    }
}
import WebKit
struct WKWebViewRepresentable: UIViewRepresentable {

    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView

    init(url: URL, webView: WKWebView = WKWebView()) {
        self.url = url
        self.webView = webView
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.scrollView.isScrollEnabled = true
               uiView.scrollView.bounces = true
        
    
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension WKWebViewRepresentable {

    final class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WKWebViewRepresentable
        private var webViews: [WKWebView]

        init(_ parent: WKWebViewRepresentable) {
            
            self.parent = parent
            self.webViews = []
           
        }
            

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                let popupWebView = WKWebView(frame: .zero, configuration: configuration)
                popupWebView.navigationDelegate = self
                popupWebView.uiDelegate = self

                parent.webView.addSubview(popupWebView)
                popupWebView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                    popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                    popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                    popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
                ])

                self.webViews.append(popupWebView)
                return popupWebView
            }

            return nil
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
                   // Web page has finished loading, scroll to top
         
               }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
           
       
            decisionHandler(.allow)
            
        }
    }
    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
          return .all // Allow a
      }
}
