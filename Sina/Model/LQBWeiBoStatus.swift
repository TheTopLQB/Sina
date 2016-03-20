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
    
//    override func setValue(value: AnyObject?, forKey key: String) {
//        super.setValue(value, forKey: key);
//        if (key == )
//    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
