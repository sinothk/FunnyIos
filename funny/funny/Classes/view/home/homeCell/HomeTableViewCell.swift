//
//  HomeTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/4/23.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var titleLabel:UILabel?
    var picImgView:UIImageView?
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI();
    }
    
    func setUpUI() {
        
        self.titleLabel = UILabel.init()
        self.titleLabel?.backgroundColor = UIColor.clear;
        self.titleLabel?.frame = CGRect(x:0, y:0, width:100, height:30)
        self.titleLabel?.text = "Title"
        self.titleLabel?.textColor = UIColor.black
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(self.titleLabel!)
        
//        self.picImgView = UIImageView()
//        self.picImgView?.frame = CGRect(x:110, y:50, width:50, height:50)
//        self.picImgView?.backgroundColor = UIColor.lightGray
//        self.picImgView?.image = UIImage.init(named: "a")
//        self.addSubview(self.picImgView!)
        
    }
}
