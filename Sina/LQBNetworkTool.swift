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
        let url = NSURL(string: path);
        let request = NSMutableURLRequest(URL: url!);
        let paramsData = try? NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
        print("api:\(path)");
        print("params:\(params)");
        request.HTTPMethod = method;
        request.HTTPBody = paramsData;
//        print(request);
        let session = NSURLSession.sharedSession();
        let task = session.dataTaskWithRequest(request) { (data, respose, error) -> Void in
            if (error == nil) {
//                let str = NSString.init(data: data!, encoding: NSUTF8StringEncoding);
//                print("----\(str!)");
                let json = try?NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments);
//                print(json!);
                successClosure(data: json! as! NSDictionary);
            }else{
                failure(error: error!);
            }
        }
        task.resume();
    }
}


extension LQBNetworkTool {
    func requestHomeStatus(params:NSDictionary,successClosure:(statusArray:NSArray)->Void,failure:(error:NSError)->Void) {
        let path = "https://api.weibo.com/2/statuses/friends_timeline.json?access_token=\(LQBAccount.shareAccount.token)&uid=\(LQBAccount.shareAccount.uid)";
        self.requestFromServer("GET", path: path, params: params, successClosure: { (data) -> Void in
            let statusArray = data["statuses"];
//            print(statusArray!);
            var modelArray:[LQBHomeCellFrame] = [];
            for index in 0..<statusArray!.count {
                let dic = statusArray![index] as!NSDictionary
                let statusModel = LQBWeiBoStatus();
                statusModel.setValuesForKeysWithDictionary(dic as! [String : AnyObject]);
                let cellFrame = LQBHomeCellFrame();
                cellFrame.weiboStatus = statusModel;
                modelArray.append(cellFrame);
            }
            successClosure(statusArray: modelArray);
            }) { (error) -> Void in
                failure(error: error);
        };
    }
}
