//
//  Public.swift
//  Sina
//
//  Created by 李庆彬 on 3/20/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import Foundation
import UIKit

let WIDTH = UIScreen.mainScreen().bounds.size.width
let HEIGHT = UIScreen.mainScreen().bounds.size.height
let appKey = "308339066"
let redictURL = "https://api.weibo.com/oauth2/default.html"
let appSecret = "e936d2f18ee455d73b37bbb06477fe8d"
let oauthURL = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redictURL)&display=mobile"

let AccountUidKey = "AccountUidKey"
let AccountTokenKey = "AccountToken"