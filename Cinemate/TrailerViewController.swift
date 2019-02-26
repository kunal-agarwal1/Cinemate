//
//  TrailerViewController.swift
//  Cinemate
//
//  Created by Kunal Agarwal on 25/02/19.
//  Copyright © 2019 Kunal. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKNavigationDelegate {

    var key: String!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(key == nil || key == "no_trailer"){
            view = UIView()
            let alertController = UIAlertController(title: "iOScreator", message:
                "Trailer not found", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
        let urlString = "https://www.youtube.com/watch?v="+key
        print(urlString)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        let request = URLRequest(url: URL(string: urlString)!)
        self.webView.load(request)
       // self.webView.allowsBackForwardNavigationGestures = true
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
       // self.view.bringSubviewToFront(webView1)
        // Do any additional setup after loading the view.
        }
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }

    @IBAction func dismissClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)

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
