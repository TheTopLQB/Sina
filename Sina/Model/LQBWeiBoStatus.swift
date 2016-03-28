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
    var time:String {
        get{
            let dateFormatter = NSDateFormatter.init();
            dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy";
            let creatDate = dateFormatter.dateFromString(self.created_at!);
            let interval = creatDate?.timeIntervalSince1970;
            return NSDateTool.time(interval!);
        }
    }
    var source:String?
    var sourceString:String {
        get {
            let location = self.source?.rangeOfString(">")?.startIndex.advancedBy(1);
            let length = self.source?.rangeOfString("</")?.startIndex.advancedBy(0);
            let range = location!..<length!;
            let str = self.source?.substringWithRange(range);
            return "来自 " + str!;
        }
    }
    var text:String?
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
        if (key == "retweeted_status") {
            let dic = value as!NSDictionary;
            let status = LQBWeiBoStatus();
            status.setValuesForKeysWithDictionary(dic as! [String : AnyObject]);
            self.retweeted_status = status;
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
        if (key == "mbrank"){
            let mbrank = value as?Int;
            self.mbrank = mbrank;
        }
        if (key == "mbtype") {
            let mbtype = value as?Int;
            self.mbtype = mbtype;
            if (mbtype > 2){
                self.vip = true;
            }else{
                self.vip = false;
            }
        }
    }
}

extension NSDate {
    func isThisYear() -> Bool {
        let unitFlags:NSCalendarUnit = NSCalendarUnit.Year;
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components(unitFlags, fromDate: self);
        let now = calendar.components(unitFlags, fromDate: NSDate())
        return components.year == now.year;
    }
    
    func isYesterday() -> Bool {
        let dateFormatter = NSDateFormatter.init();
        dateFormatter.dateFormat = "yyyy--MM--dd";
        let dateString = dateFormatter.stringFromDate(self);
        let nowString = dateFormatter.stringFromDate(NSDate());
        
        let preDate = dateFormatter.dateFromString(dateString);
        let nowDate = dateFormatter.dateFromString(nowString);
        
        let unitFlags:NSCalendarUnit = [.Day, .Month, .Year];
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components(unitFlags, fromDate: preDate!, toDate: nowDate!, options: NSCalendarOptions.WrapComponents)
        if (components.year == 0 && components.month == 0 && components.day == 1 ) {
            return true;
        }else {
            return false;
        }
    }
    
    func isToday() -> Bool {
        let dateFormatter = NSDateFormatter.init();
        dateFormatter.dateFormat = "yyyy--MM--dd";
        let dateString = dateFormatter.stringFromDate(self);
        let nowString = dateFormatter.stringFromDate(NSDate());
        return dateString == nowString;
    }
}


class NSDateTool: NSObject {
    static func time(timeInterval:NSTimeInterval) -> String {
        let now = NSDate();//获取当前时间
        let preDate = NSDate.init(timeIntervalSince1970: timeInterval);//获取要处理的时间
        let calendar = NSCalendar.currentCalendar();//日期对象
        let unitFlags: NSCalendarUnit = [.Second, .Minute, .Hour, .Day, .Month, .Year];
        //枚举要比较的时间，比如 Year为年，就是两个时间之间年份的差值
        let components = calendar.components(unitFlags, fromDate: preDate, toDate: now, options:NSCalendarOptions.WrapComponents)
        let dateFormatter = NSDateFormatter.init();
        if (preDate.isThisYear()) {
            if (preDate.isYesterday()) {
                dateFormatter.dateFormat = "昨天 HH:mm";
                return dateFormatter.stringFromDate(preDate);
            }else if (preDate.isToday()) {
                if (components.hour >= 1) {
                    return String(components.hour) + "小时前";
                }else if (components.minute >= 1) {
                    return String(components.minute) + "分钟前";
                }else {
                    return "刚刚";
                }
            }else {
                dateFormatter.dateFormat = "MM-dd HH:mm";
                return dateFormatter.stringFromDate(preDate);
            }
        }else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
            return dateFormatter.stringFromDate(preDate);
        }
    }
}














