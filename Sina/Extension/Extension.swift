//
//  Extension.swift
//  Sina
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import Foundation

extension NSString {
    static func sizeFromString(str:NSString,font:UIFont,width:CGFloat) -> CGSize {
        let options:NSStringDrawingOptions = [.UsesLineFragmentOrigin,.UsesFontLeading];
        let attribute = [NSFontAttributeName:UIFont.systemFontOfSize(14)];
        let size = str.boundingRectWithSize(CGSizeMake(width,CGFloat(MAXFLOAT)), options: options, attributes: attribute, context: nil).size;
        return size;
    }
}

