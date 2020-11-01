//
//  ViewController.swift
//  Webkit
//
//  Created by Pushpinder Pal Singh on 01/11/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        
        
        guard let scriptPath = Bundle.main.path(forResource: "script", ofType: "js"),
              let scriptSource = try? String(contentsOfFile: scriptPath) else { return }
        
        
        let config = WKWebViewConfiguration()
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        
        config.userContentController.addUserScript(script)
        config.userContentController.add(self, name: "count")
        
        let webView = WKWebView(frame: view.bounds, configuration: config)
        
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.load(myRequest)
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let cssPath = Bundle.main.path(forResource: "style", ofType: "css"),
              let cssSource = try? String(contentsOfFile: cssPath).components(separatedBy: .newlines).joined() else { return }
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(cssSource)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js)
    }
    
}
