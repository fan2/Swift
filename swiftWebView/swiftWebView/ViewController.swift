//
//  ViewController.swift
//  swiftWebView
//
//  Created by faner on 2016/9/16.
//  Copyright © 2016年 zimushan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    // 可在导航栏创建 UIButton，实现 webView.goBack()、webView.goForward()、webView.reload()、webView.stopLoading()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 创建 UIWebView
        let webView = UIWebView();
        // 设置 UIWebView 占满主视图（self.view）的frame
        webView.frame = self.view.frame;
        // 将 UIWebView 添加到主视图（self.view）
        self.view.addSubview(webView)
        // 设置 UIWebView 的回调为当前主控制器（ViewController）
        webView.delegate = self;
        
        // 初始化 NSURL
        let urlString = "https://developer.apple.com/swift/"
        let url = NSURL(string: urlString)
        // let url = NSURL(string: "https://peterwitham.com/swift/intermediate/how-to-use-the-uiwebview-in-ios/")
        // 初始化 NSURLRequest
        let urlRequest = NSURLRequest(url : url! as URL)
        // UIWebView 加载 NSURLRequest
        webView.loadRequest(urlRequest as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIWebViewDelegate
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        // shouldStart
        return true;
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView)
    {
        // 网络请求转菊花
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView)
    {
        // 加载完毕，停转菊花
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        // 加载失败，停转菊花
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("There was a problem loading the web page!")
    }
}

