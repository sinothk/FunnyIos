//
//  Status.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/21.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class Status{
    var avatar:String?
    var name:String?
    var time:String?
    var source:String?
    
    var textContent:String?
    
    var imgUrls:Array<String>?
    
    init(name: String, avatar: String, time: String, source: String) {
        self.avatar = avatar
        self.name = name
        self.time = time
        self.source = source
    }
}
