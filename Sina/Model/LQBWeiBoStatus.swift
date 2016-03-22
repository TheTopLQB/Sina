//
//  LQBWeiBoStatus.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBWeiBoStatus: NSObject {
    var attitudes_count:Int?
    var comments_count:Int?
    var reposts_count:Int?
    
    var idstr:String?
    var created_at:String?
    var NSString:String?
    var pic_urls:NSArray?
    var retweeted_status:LQBWeiBoStatus?
    var user:User?
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key);
        if (key == "user") {
            let dic = value as!NSDictionary;
            let user = User();
            user.setValuesForKeysWithDictionary(dic as! [String : AnyObject]);
            self.user = user;
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}

class User: NSObject {
    var name:String?
    var profile_image_url:String?
    var idstr:String?
    var mbtype:Int?//会员
    var mbrank:Int?//会员等级
    var vip:Bool?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}


















