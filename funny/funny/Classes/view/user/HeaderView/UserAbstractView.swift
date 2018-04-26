//
//  UserAbstractView.swift
//  funny
//
//  Created by gyzkhy on 2018/4/26.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class UserAbstractView: UIView{
    
    let screenSize:CGRect = UIScreen.main.bounds
    
    private lazy var bgView: UIImageView = UIImageView(image: UIImage(named:"ic_chat_def_pic"))
    private lazy var userWordLabel:UILabel = UILabel(title: "用户名称",fontSize: 14,color: UIColor.gray)
    // 用户头像
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named:"avatar_test"))
    // 用户名
    private lazy var nameLabel:UILabel = UILabel(title: "用户名称",fontSize: 20,color: UIColor.white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.height = screenSize.height * 0.40
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 展示用户信息
    func show(info: UserEntity) -> UserAbstractView {
       
        bgView.show(url: info.headerBg ?? "")
        
        userWordLabel.text = info.keyword ?? ""
        userWordLabel.backgroundColor = UIColor.white
        userWordLabel.textAlignment = NSTextAlignment.right
   
        iconView.show(url: info.avatar ?? "")
//        iconView.layer.cornerRadius = userAvatarIconBigSize/2
//        iconView.layer.masksToBounds = true
        iconView.layer.borderWidth = 2  //边框粗细
        iconView.layer.borderColor = UIColor.white.cgColor //边框颜色
        
        nameLabel.text = info.name

        addSubview(bgView)
        addSubview(userWordLabel)
        
        addSubview(iconView)
        addSubview(nameLabel)
        
        // 布局
        
        iconView.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-StatusCellMargin)
            make.bottom.equalTo(self.snp.bottom)//.offset(-StatusCellMargin)
            
            make.width.equalTo(userAvatarIconBigSize)
            make.height.equalTo(userAvatarIconBigSize)
        }
        
        userWordLabel.snp.makeConstraints { (make) in
            make.right.equalTo(iconView.snp.left).offset(-(StatusCellMargin/2))
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom)
            
            make.height.equalTo(40)
        }
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(userWordLabel.snp.top)
        }
        
       

        nameLabel.snp.makeConstraints { (make) in
            make.right.equalTo(iconView.snp.left).offset(-(StatusCellMargin/2))
            make.top.equalTo(iconView.snp.top).offset(StatusCellMargin/2)

            make.height.equalTo(40)
        }
        
        
        return self
    }
}
