//
//  RefreshFooter.swift
//  lingdang
//
//  Created by 李庆彬 on 3/14/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class RefreshFooter: UIView {

    static func footer() ->AnyObject {
        return NSBundle.mainBundle().loadNibNamed("RefreshFooter", owner: nil, options: nil).last!;
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
