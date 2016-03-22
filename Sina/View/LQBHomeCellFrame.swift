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
    var nameLabelFrame:CGRect?
    var vipLevelImageFrame:CGRect?
    var weiboStatus:LQBWeiBoStatus = LQBWeiBoStatus() {
        didSet {
            self.avatarImageViewFrame = CGRectMake(10, 10, 40, 40);
            let size = NSString.sizeFromString((weiboStatus.user?.name!)!, font: UIFont.systemFontOfSize(14), width: CGFloat(MAXFLOAT));
            self.nameLabelFrame = CGRectMake(60, 10, size.width, 30);
            self.vipLevelImageFrame = CGRectMake(CGRectGetMaxX(self.nameLabelFrame!)+10, 18, 15, 15);
        }
    }
}
