//
//  LQBOauthViewController.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit
import WebKit

class LQBOauthViewController: UIViewController, WKNavigationDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = WKWebView.init(frame: CGRectMake(0, 0, WIDTH, HEIGHT));
        self.view.addSubview(webView);
        webView.navigationDelegate = self;
        let url = NSURL(string: oauthURL);
        let request = NSURLRequest.init(URL: url!);
        print(request);
        webView.loadRequest(request);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        //通过拦截URL，获取code，然后需要code去请求用户的个人信息
        let requestStr = (navigationAction.request.URL?.absoluteString)!
        "https://api.weibo.com/oauth2/default.html?code=fede30823255ef1ce3497e3f48888ec0"
        if (requestStr.containsString("code=")) {//如果包含code字符串，则截取请求
            let range = requestStr.rangeOfString("code=")!;
            let index = range.last!
            let code = requestStr.substringFromIndex(index.advancedBy(1));
            //拿到code后，作为参数请求个人帐号信息
//            let params = ["client_id":appKey,
//                   "client_secret":appSecret,
//                      "grant_type":"authorization_code",
//                    "redirect_uri":redictURL,
//                            "code":code];
            let networker = LQBNetworkTool();
            //虽然此处新浪微博说的是POST请求，但是不把参数放在url里面会报错，这是个巨坑。
            networker.requestFromServer("POST", path: "https://api.weibo.com/oauth2/access_token?client_id=\(appKey)&client_secret=\(appSecret)&grant_type=authorization_code&code=\(code)&redirect_uri=\(redictURL)", params: [:], successClosure: { (data) -> Void in
                print(data);
                LQBAccount.shareAccount.uid = data["uid"] as!String;
                LQBAccount.shareAccount.token = data["access_token"] as!String;
                NSUserDefaults.standardUserDefaults().setValue(data["uid"] as!String, forKey: AccountUidKey);
                NSUserDefaults.standardUserDefaults().setValue(data["access_token"] as!String, forKey: AccountTokenKey);
                let tab = LQBTabViewController();
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.view.window?.rootViewController = tab;
                });
                }, failure: { (error) -> Void in
            });

            decisionHandler(WKNavigationActionPolicy.Cancel);
        }else{
            decisionHandler(WKNavigationActionPolicy.Allow);
        }
    }

}
