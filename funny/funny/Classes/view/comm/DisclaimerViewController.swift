//
//  DisclaimerViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/20.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit
import WebKit

class DisclaimerViewController: UIViewController ,WKUIDelegate, WKNavigationDelegate{
   
    @IBOutlet weak var myWeb: WKWebView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    //返回键
    @objc func titleBarLeftBtn(){
        self.dismiss(animated: false, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.action = #selector(titleBarLeftBtn)

        initWebView(urlStr: "https://www.baidu.com/")
    }

    func initWebView(urlStr: String) -> Void {
        myWeb.uiDelegate = self
        myWeb.navigationDelegate = self
        myWeb.load(NSURLRequest(url: NSURL(string:urlStr)! as URL) as URLRequest)  
    }
    
    
    //页面开始加载时调用
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        print("111111")
        progressBar.startAnimating()
    }
    
    // 页面加载失败时调用
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error){
        print("222")
    }
    
    // 当内容开始返回时调用
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        print("333")
        progressBar.stopAnimating()
        progressBar.isHidden = true
    }
    
    // 页面加载完成之后调用
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        print("4444")
    }
}
