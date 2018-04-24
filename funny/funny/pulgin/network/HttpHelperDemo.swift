//
//  HttpHelperDemo.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/14.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

//
public class HttpHelperDemo{
    
    func test(){
//        HttpHelper.shared.doGet(
//            path: "http://httpbin.org",
//            success: { result in
//                print(result)
//            },
//            failure:{ error in
//                print("====================\(error)============")
//            }
//        )
        
        HttpHelper.shared.doPost(path: "", paras: "", success: { (res) in
            
        }) { (er) in
            
        }
        
//        let p = "{\"name\":\"BeJson\",\"page\":88}"
//        HttpHelper.shared.doPost(
//            path: "http://httpbin.org/post",
//            paras: p,
//            success: { result in
//                print(result)
//            },
//            failure:{ error in
//                    print("====================\(error)============")
//            }
//            )
    
//        // 类对象转Json
//        let p = Person(name:"TestName", age:"testAge")
//        let jsonStr = JsonHelper.shared.ToJson(p)
//        print(jsonStr)
//
//        // json转实体
//        let person = JsonHelper.shared.ToObject(jsonStr) as Person
//        print("\(person.name)")
    }
}


