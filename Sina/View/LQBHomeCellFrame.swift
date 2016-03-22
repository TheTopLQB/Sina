//
//  LQBHomeCellFrame.swift
//  Sina
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBHomeCellFrame: NSObject {
    var avatarImageViewFrame:CGRect?
    var weiboStatus:LQBWeiBoStatus = LQBWeiBoStatus() {
        didSet {
            self.avatarImageViewFrame = CGRectMake(10, 10, 40, 40);
        }
    }
}
