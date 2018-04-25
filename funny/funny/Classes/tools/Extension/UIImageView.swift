//
//  File.swift
//  funny
//
//  Created by gyzkhy on 2018/4/24.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//


import UIKit

extension UIImageView{
    
    //MARK: 使用通用默认图片
    func show(url:String) -> Void {
        show(url: url, defaultImg: UIImage(named:"ic_chat_def_pic")!)
    }
    
    //MARK: 指定默认图片
    func show(url:String, defaultImg: UIImage) -> Void {
        self.load.request(with: url, placeholder: defaultImg, options: [], onCompletion: { _,_,_  in })
    }
}
