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
    var contentLabelFrame:CGRect?
    
    var retweetViewFrame:CGRect?
    var retweetContentLableFrame:CGRect?
    var retweetPhotosViewFrame:CGRect?

    var bottomButtonViewFrame:CGRect?
    var bottomViewFrame:CGRect?
    var cellHeight:CGFloat?

    var weiboStatus:LQBWeiBoStatus = LQBWeiBoStatus() {
        didSet {
            self.avatarImageViewFrame = CGRectMake(10, 10, 40, 40);
            let size = NSString.sizeFromString((weiboStatus.user?.name!)!, font: UIFont.systemFontOfSize(14), width: CGFloat(MAXFLOAT));
            self.nameLabelFrame = CGRectMake(60, 10, size.width, 30);
            self.vipLevelImageFrame = CGRectMake(CGRectGetMaxX(self.nameLabelFrame!)+10, 18, 15, 15);
            let contentSize = NSString.sizeFromString(weiboStatus.text!, font: UIFont.systemFontOfSize(14), width: WIDTH - 20);
            self.contentLabelFrame = CGRectMake(10, CGRectGetMaxY(self.avatarImageViewFrame!)+10, contentSize.width, contentSize.height);
            var retweetdHeight:CGFloat = 0.0;
            if (weiboStatus.retweeted_status != nil) {
                let retweetedContent = (weiboStatus.retweeted_status?.user?.name)! + (weiboStatus.retweeted_status?.text)!;
                let retweetedContentSize = NSString.sizeFromString(retweetedContent, font: UIFont.systemFontOfSize(14), width: WIDTH - 40);
                self.retweetContentLableFrame = CGRectMake(10, 10, retweetedContentSize.width, retweetedContentSize.height);
                if (weiboStatus.retweeted_status?.pic_urls?.count > 0){
                    self.retweetPhotosViewFrame = CGRectMake(10, CGRectGetMaxY(self.retweetContentLableFrame!) + 10, WIDTH - 40, 100);
                    retweetdHeight = CGRectGetMaxY(self.retweetPhotosViewFrame!) + 10.0;
                }else{
                    retweetdHeight = CGRectGetMaxY(self.retweetContentLableFrame!) + 10.0;
                }
                self.retweetViewFrame = CGRectMake(0, CGRectGetMaxY(self.contentLabelFrame!) + 10, WIDTH, retweetedContentSize.height + 130);
            }else {
                self.retweetViewFrame = CGRectZero;
            }
            
            self.bottomButtonViewFrame = CGRectMake(0, CGRectGetMaxY(self.contentLabelFrame!)+retweetdHeight + 10.0, WIDTH, 40);
            self.bottomViewFrame = CGRectMake(0, CGRectGetMaxY(self.bottomButtonViewFrame!), WIDTH, 10);
            self.cellHeight = CGRectGetMaxY(self.bottomViewFrame!);
        }
    }
}
