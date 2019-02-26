//
//  GridTrailerViewController.swift
//  Cinemate
//
//  Created by Kunal Agarwal on 25/02/19.
//  Copyright © 2019 Kunal. All rights reserved.
//

import UIKit
import WebKit

class GridTrailerViewController: UIViewController, WKNavigationDelegate {
    
    var key: String!
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let URLstring = "https://www.youtube.com/watch?v="+key
        print(URLstring)
        let url = URL(string: URLstring)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
