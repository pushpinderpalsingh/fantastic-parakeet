//
//  ViewController.swift
//  Webkit
//
//  Created by Pushpinder Pal Singh on 01/11/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
