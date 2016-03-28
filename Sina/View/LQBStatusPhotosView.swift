//
//  LQBStatusPhotosView.swift
//  Sina
//
//  Created by 李庆彬 on 3/24/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

let photoWH = Int((UIScreen.mainScreen().bounds.size.width - 40.0)/3.0);
let margin = 10;

class LQBStatusPhotosView: UIView {

    var photos:[NSDictionary] = [] {
        didSet {
            let count = photos.count;
            while (self.subviews.count < count) {
                let imageView = UIImageView();
                imageView.backgroundColor = UIColor.lightGrayColor();
//                imageView.backgroundColor = UIColor.redColor();
//                imageView.contentMode = UIViewContentMode.ScaleAspectFill;
//                imageView.clipsToBounds = true;
                self.addSubview(imageView);
            }
            
            for index in 0..<self.subviews.count {
                let imageView = self.subviews[index] as!UIImageView;
                if (index < count) {
                    imageView.hidden = false;
                    let dic = self.photos[index];
                    imageView.sd_setImageWithURL(NSURL(string: dic["thumbnail_pic"] as! String));
                }else{
                    imageView.hidden = true;
                }
            }
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews();
        let count = self.photos.count;
        let col = (count == 4) ? 2 : 3;//列数
        for index in 0..<count {
            let imageView = self.subviews[index];
            let lie = index % col;
            let hang = index / col;
            let imageX = CGFloat(lie * (photoWH + margin));
            let imageY = CGFloat(hang * (photoWH + margin));
            imageView.frame = CGRectMake(imageX, imageY, CGFloat(photoWH), CGFloat(photoWH));
        }
    }
    
    static func photosSize(count:Int)->CGSize {
        let col = (count == 4) ? 2 : 3;//列数
        let photosViewW = col * photoWH + (col - 1) * margin;
        
        let row = (col + count - 1) / col;
        let photosViewH = row * photoWH + (row - 1) * margin;
        return CGSizeMake(CGFloat(photosViewW), CGFloat(photosViewH));
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
