//
//  Extension.swift
//  Sina
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//  拓展

import Foundation

//字符串拓展
extension NSString {
    //通过字符串，获取字符串所占size
    static func sizeFromString(str:NSString,font:UIFont,width:CGFloat) -> CGSize {
        let options:NSStringDrawingOptions = [.UsesLineFragmentOrigin,.UsesFontLeading];
        let attribute = [NSFontAttributeName:UIFont.systemFontOfSize(14)];
        let size = str.boundingRectWithSize(CGSizeMake(width,CGFloat(MAXFLOAT)), options: options, attributes: attribute, context: nil).size;
        return size;
    }
}

