//
//  LQBHomeTableViewCell.swift
//  Sina
//
//  Created by 李庆彬 on 3/21/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBHomeTableViewCell: UITableViewCell {
    var avatarImageView:UIImageView?
    var nameLabel:UILabel?
    var vipLevelImage:UIImageView?
    var contentLabel:UILabel?
    var bottomView:UIView?
    var bottomButtonView:BottomButtonView?
    var cellFrame:LQBHomeCellFrame = LQBHomeCellFrame() {
        didSet {
            self.avatarImageView?.frame = cellFrame.avatarImageViewFrame!;
            let imageStr = cellFrame.weiboStatus.user?.profile_image_url;
            self.avatarImageView?.sd_setImageWithURL(NSURL(string: imageStr!), placeholderImage: nil);
            self.nameLabel?.frame = cellFrame.nameLabelFrame!;
            self.contentLabel?.frame = cellFrame.contentLabelFrame!;
            self.bottomView?.frame = cellFrame.bottomViewFrame!;
            self.bottomButtonView?.frame = cellFrame.bottomButtonViewFrame!;
            let name = cellFrame.weiboStatus.user?.name;
            self.nameLabel?.text = name!;
            if ((cellFrame.weiboStatus.user?.vip)==true) {
                self.nameLabel?.textColor = UIColor.orangeColor();
                let imagename = "common_icon_membership_level\((cellFrame.weiboStatus.user?.mbrank!)!)";
                self.vipLevelImage?.hidden = false;
                self.vipLevelImage?.frame = cellFrame.vipLevelImageFrame!;
                self.vipLevelImage?.image = UIImage.init(named: imagename);
            }else{
                self.nameLabel?.textColor = UIColor.blackColor();
                self.vipLevelImage?.hidden = true;
            }
            self.contentLabel?.text = cellFrame.weiboStatus.text;
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None;
        self.avatarImageView = UIImageView.init();
        self.avatarImageView?.layer.cornerRadius = 20;
        self.avatarImageView?.layer.masksToBounds = true;
        self.contentView.addSubview(self.avatarImageView!);
        
        self.nameLabel = UILabel.init();
        self.nameLabel?.textColor = UIColor.orangeColor();
        self.nameLabel?.font = UIFont.systemFontOfSize(14);
        self.contentView.addSubview(self.nameLabel!);
        
        self.vipLevelImage = UIImageView.init();
        self.contentView.addSubview(self.vipLevelImage!);
        
        self.contentLabel = UILabel();
        self.contentLabel?.font = UIFont.systemFontOfSize(14);
        self.contentLabel?.numberOfLines = 0;
        self.contentView.addSubview(self.contentLabel!);
        
        self.bottomView = UIView();
        self.bottomView?.backgroundColor = UIColor.lightGrayColor();
        self.contentView.addSubview(self.bottomView!);
        
        self.bottomButtonView = NSBundle.mainBundle().loadNibNamed("BottomButtonView", owner: nil, options: nil).last as?BottomButtonView;
        self.contentView.addSubview(self.bottomButtonView!);
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
