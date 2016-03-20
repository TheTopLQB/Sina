//
//  LQBNavigation.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class LQBNavigation: NSObject {
    func barItem(title:String,image:String, tagart:AnyObject,action:Selector)->UIBarButtonItem {
        let button = UIButton.init(type: UIButtonType.Custom);
        button.frame = CGRectMake(0, 0, 44, 44);
        button.setTitle(title, forState: UIControlState.Normal);
        button.setImage(UIImage.init(named: image), forState: UIControlState.Normal);
        let buttonItem = UIBarButtonItem.init(customView: button);
        button.addTarget(tagart, action:action, forControlEvents: UIControlEvents.TouchUpInside);
        return buttonItem;
    }
}
