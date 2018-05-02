//
//  SettingItemEntity.swift
//  funny
//
//  Created by gyzkhy on 2018/5/2.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import Foundation

class SettingItemEntity {
    var itemIocn:String? = nil
    var itemName:String? = nil
    
    init(icon: String, name: String) {
        self.itemIocn = icon
        self.itemName = name
    }
    
}
