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
    var cellFrame:LQBHomeCellFrame = LQBHomeCellFrame() {
        didSet {
            self.avatarImageView?.frame = cellFrame.avatarImageViewFrame!;
            let imageStr = cellFrame.weiboStatus.user?.profile_image_url;
            self.avatarImageView?.sd_setImageWithURL(NSURL(string: imageStr!), placeholderImage: nil);
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView = UIImageView.init();
        self.avatarImageView?.backgroundColor = UIColor.redColor();
        self.contentView.addSubview(self.avatarImageView!);
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
