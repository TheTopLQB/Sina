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
    
    var cellFrame:LQBHomeCellFrame = LQBHomeCellFrame() {
        didSet {
            self.avatarImageView?.frame = cellFrame.avatarImageViewFrame!;
            let imageStr = cellFrame.weiboStatus.user?.profile_image_url;
            self.avatarImageView?.sd_setImageWithURL(NSURL(string: imageStr!), placeholderImage: nil);
            
            self.nameLabel?.frame = cellFrame.nameLabelFrame!;
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
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
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
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
