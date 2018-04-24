//
//  Person.swift
//  Demo001
//
//  Created by gyzkhy on 2018/3/8.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

//个人信息类
class Person: NSObject,Decodable,Encodable {
    var name:String = ""
    var age:String = ""
    
    init(name:String, age:String) {
        super.init()
        
       // setValuesForKeys(dict)
        self.name = name
        self.age = age
    }
    
    override var description: String{
        return "\(name,age)"
    }
}
