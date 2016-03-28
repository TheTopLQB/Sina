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
    
    var timeLabelFrame:CGRect?
    var sourceLabelFrame:CGRect?
    
    var contentLabelFrame:CGRect?
    var photosViewFrame:CGRect?
    
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
            let timeLabelSize = NSString.sizeFromString(weiboStatus.time, font: UIFont.systemFontOfSize(12), width: CGFloat(MAXFLOAT));
            self.timeLabelFrame = CGRectMake(60, 35, timeLabelSize.width, 20);
            
            let souceSize = NSString.sizeFromString(weiboStatus.sourceString, font: UIFont.systemFontOfSize(12), width: CGFloat(MAXFLOAT));
            self.sourceLabelFrame = CGRectMake(CGRectGetMaxX(self.timeLabelFrame!), 35, souceSize.width, 20);
            
            self.vipLevelImageFrame = CGRectMake(CGRectGetMaxX(self.nameLabelFrame!)+10, 18, 15, 15);
            let contentSize = NSString.sizeFromString(weiboStatus.text!, font: UIFont.systemFontOfSize(14), width: WIDTH - 20);
            self.contentLabelFrame = CGRectMake(10, CGRectGetMaxY(self.avatarImageViewFrame!)+10, contentSize.width, contentSize.height);
            var originalStausHeight:CGFloat = 0.0;
            if (weiboStatus.pic_urls?.count > 0) {
                let photosViewSize = LQBStatusPhotosView.photosSize((weiboStatus.pic_urls?.count)!);
                self.photosViewFrame = CGRectMake(10, CGRectGetMaxY(self.contentLabelFrame!)+10, photosViewSize.width, photosViewSize.height);
                originalStausHeight = CGRectGetMaxY(self.photosViewFrame!);
            }else {
                originalStausHeight = CGRectGetMaxY(self.contentLabelFrame!);
                self.photosViewFrame = CGRectZero;
            }
            
            var retweetdStatusHeight:CGFloat = 0.0;
            if (weiboStatus.retweeted_status != nil) {
                let retweetedContent = (weiboStatus.retweeted_status?.user?.name)! + (weiboStatus.retweeted_status?.text)!;
                let retweetedContentSize = NSString.sizeFromString(retweetedContent, font: UIFont.systemFontOfSize(14), width: WIDTH - 20);
                self.retweetContentLableFrame = CGRectMake(10, 10, retweetedContentSize.width, retweetedContentSize.height);
                if (weiboStatus.retweeted_status?.pic_urls?.count > 0){
                    let retweetPhotosViewSize = LQBStatusPhotosView.photosSize((weiboStatus.retweeted_status?.pic_urls?.count)!);
                    self.retweetPhotosViewFrame = CGRectMake(10, CGRectGetMaxY(self.retweetContentLableFrame!) + 10, retweetPhotosViewSize.width, retweetPhotosViewSize.height);
                    retweetdStatusHeight = CGRectGetMaxY(self.retweetPhotosViewFrame!) + 10.0;
                }else{
                    self.retweetPhotosViewFrame = CGRectZero;
                    retweetdStatusHeight = CGRectGetMaxY(self.retweetContentLableFrame!) + 10.0;
                }
                self.retweetViewFrame = CGRectMake(0, originalStausHeight + 10, WIDTH, retweetdStatusHeight);
            }else {
                self.retweetViewFrame = CGRectZero;
            }
            
            self.bottomButtonViewFrame = CGRectMake(0, originalStausHeight + 10 + retweetdStatusHeight + 10.0, WIDTH, 40);
            self.bottomViewFrame = CGRectMake(0, CGRectGetMaxY(self.bottomButtonViewFrame!), WIDTH, 10);
            self.cellHeight = CGRectGetMaxY(self.bottomViewFrame!);
        }
    }
}
