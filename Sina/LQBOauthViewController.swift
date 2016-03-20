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
        let url = NSURL(string: oauthURL);
        let request = NSURLRequest.init(URL: url!);
        print(request);
        webView.loadRequest(request);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
