//
//  UserEntity.swift
//  funny
//
//  Created by gyzkhy on 2018/4/19.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import Foundation
import HandyJSON

class UserEntity: HandyJSON {
    var age: Int = 18
    var name: String?
    var avatar: String?
    var headerBg: String?
    var keyword:String?
    var sex:Int = 0
    
    var email:String?
    var phoneNum:String?
    
    
    required init() {}
}

