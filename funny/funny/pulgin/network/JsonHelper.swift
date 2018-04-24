//
//  JsonHelper.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/14.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class JsonHelper {
    static let shared = JsonHelper();
    private let decoder=JSONDecoder();
    private let encoder=JSONEncoder();
    
    private init(){}
    
    func ToJson<T:Codable>(_ obj:T) -> String {
        let data=try! self.encoder.encode(obj)
        let str=String(data:data,encoding:.utf8)!
        return str
    }
    
    func ToObject<T:Codable>(_ data:String) -> T{
        let obj=try! self.decoder.decode(T.self, from: data.data(using: .utf8)!)
        return obj;
    }
    
    func GetData(_ str:String) -> Data {
        return str.data(using: .utf8)!
    }
    
    func GetJson(_ data:Data) -> String {
        return String(data:data,encoding:.utf8)!
    }
}
