//
//  ImageHelper.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/19.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//
//  使用：ImageHelper.shared.show(imageView: avatar, urlStr: "http://sinothk.com/images/about.png")

import UIKit

public class ImageHelper{
    //单例
    public static var shared = ImageHelper();
    // 限制只能使用单例调用，不能实例化对象
    private init(){}
    
    public func show(imageView: UIImageView, urlStr: String){
        //创建URL对象
        let url = URL(string:urlStr)!
        
        //创建请求对象
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    
                    if res.statusCode == 200{
                        if let imageData = data {
                            // Finally convert that Data into an image and do what you wish with it.
                            let image = UIImage(data: imageData)
                            // Do something with your image.
                            DispatchQueue.main.async() { () -> Void in
                                imageView.image = image
                            }
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    }else{
                        print("图片地址不可用！")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
            }.resume()
    }
}
