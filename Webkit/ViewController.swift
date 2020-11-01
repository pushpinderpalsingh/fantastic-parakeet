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
        
        let config = WKWebViewConfiguration()
        
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
    
}
