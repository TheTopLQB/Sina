//
//  LQBAccount.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBAccount: NSObject {
    var uid:String!
    var token:String!
    class var shareAccount:LQBAccount {
        Inner.instance.uid =
            NSUserDefaults.standardUserDefaults().objectForKey(AccountUidKey)as?String;
        Inner.instance.token = NSUserDefaults.standardUserDefaults().objectForKey(AccountTokenKey)as?String;
        return Inner.instance;
    }
    struct Inner {
        static let instance:LQBAccount = LQBAccount();
    }
}
