//
//  ViewController.swift
//  Webkit
//
//  Created by Pushpinder Pal Singh on 01/11/20.
//

import UIKit
import WebKit
import Lottie

class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var loadingAnimation: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.isHidden = true
        loadingAnimation.loopMode = .loop
        loadingAnimation.play()
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        
        webView.navigationDelegate = self
        webView.load(myRequest)
        
    }
    
    @IBAction func BackPressed(_ sender: UIBarButtonItem) {
        
        webView.goBack()
        
    }
    
    @IBAction func forwardPressed(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    
}

extension ViewController: WKNavigationDelegate {

    
    // 4. WKWebView finish loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingAnimation.isHidden = true
        webView.isHidden = false
    }
}
