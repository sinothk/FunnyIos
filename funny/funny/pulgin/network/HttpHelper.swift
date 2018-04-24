//
//  HttpHelper.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/14.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//
import UIKit

public class HttpHelper{
    //单例
    public static var shared = HttpHelper();
    
    // 限制只能使用单例调用，不能实例化对象
    private init(){}
    
    // MARK:- get请求
    public func doGet(path: String, success: @escaping ((_ result: String) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            
            if let data = data {
                if let result = String(data:data,encoding:.utf8){
                    success(result)
                }
            }else {
                failure(error!)
            }
        }
        dataTask.resume()// 异步请求
    }
    
    // MARK:- post请求
    public func doPost(path: String,paras: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = paras.data(using: .utf8)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            
            if let data = data {
                
                if let result = String(data:data,encoding:.utf8){
                    success(result)
                }
                
            }else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    // MARK:- get请求
    private func Get(path: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
            
            if let data = data {
                
                if let result = String(data:data,encoding:.utf8){
                    
                    success(result)
                }
            }else {
                
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    
    // MARK:- post请求
    private func Post(path: String,paras: String,success: @escaping ((_ result: String) -> ()),failure: @escaping ((_ error: Error) -> ())) {
        
        let url = URL(string: path)
        var request = URLRequest.init(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = paras.data(using: .utf8)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            
            if let data = data {
                
                if let result = String(data:data,encoding:.utf8){
                    success(result)
                }
            }else {
                failure(error!)
            }
        }
        dataTask.resume()
    }
}

