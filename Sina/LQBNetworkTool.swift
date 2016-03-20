//
//  LQBNetworkTool.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBNetworkTool: NSObject ,NSURLSessionDelegate{
    func requestFromServer(method:String,path:String,params:NSDictionary,successClosure:(data:NSDictionary)->Void,failure:(error:NSError)->Void) {
        let urlStr = "https://api.weibo.com/oauth2/"+path;
        print(urlStr);
        let url = NSURL(string: urlStr);
        let request = NSMutableURLRequest(URL: url!);
        print(request);
        let paramsData = try? NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
        print(params);
        request.HTTPMethod = method;
        request.HTTPBody = paramsData;
        let session = NSURLSession.sharedSession();
        let task = session.dataTaskWithRequest(request) { (data, respose, error) -> Void in
            if (error == nil) {
                let json = try?NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments);
                successClosure(data: json! as! NSDictionary);
            }else{
                
            }
        }
        task.resume();
    }
}
