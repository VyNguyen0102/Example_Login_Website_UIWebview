//
//  LoginViewController.swift
//  Sample Login
//
//  Created by Vy Nguyen on 12/22/15.
//  Copyright © 2015 VVLab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    
    convenience init(){
        self.init(nibName: "LoginViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlAddress = "https://m.facebook.com/login/"
        let url = NSURL(string: urlAddress)
        let requestObj = NSURLRequest.init(URL:url!)
        webView.loadRequest(requestObj)
        webView.delegate = self
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.URL)
        if (((request.URL?.absoluteString.containsString("login")) == false)){
            let viewController = MainViewController.init()
            self.presentViewController(viewController, animated: true, completion: nil)
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
