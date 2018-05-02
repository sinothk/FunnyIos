//
//  UserTopView.swift
//  funny
//
//  Created by gyzkhy on 2018/5/2.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class UserTopView: UIView {
    
    let screenSize:CGRect = UIScreen.main.bounds
    
    //MARK: 展示用户信息
    func show(info: UserEntity) -> UserTopView {

        // 设置工作
        iconView.show(url:(info.avatar)!)
        nameLabel.text = info.name
        
        sexIconView.image = UIImage(named: "ic_weibouser_female")
        
        timeLabel.text = "27"
        
        //            sourceLabel.text = viewModel?.status?.source
        //                        centerLabel.text = "Test"
        
        return self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.height = screenSize.height * 0.18
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 用户头像
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named:"avatar_test"))
    // 用户名
    private lazy var nameLabel:UILabel = UILabel(title: "用户名称",fontSize: 18,color: Constants.Colors.COLOR_TXT_ITEM_L1)
    // 会员图标
    private lazy var vipIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    // 等级图标
    private lazy var levelIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    
    // 性别
    private lazy var sexIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    // 时间
    private lazy var timeLabel:UILabel = UILabel(title: "刚刚", fontSize: 16, color: UIColor.gray)
    // 来源
//    private lazy var sourceLabel:UILabel = UILabel(title: "原创",fontSize: 14, color: UIColor.gray)
    
    // 来源
    private lazy var bottomView: UILabel = UILabel(title: "",fontSize: 14, color: UIColor.lightGray)
}

extension UserTopView{
    
    private func setupUI(){
        backgroundColor = UIColor.white//UIColor(white:0.95, alpha: 1.0)
        
//        iconView.layer.cornerRadius = userAvatarIconNormalSize/2
//        iconView.layer.masksToBounds = true
        iconView.layer.borderWidth = 1  //边框粗细
        iconView.layer.borderColor = UIColor.orange.cgColor //边框颜色
        
//        nameLabel.textColor = Constants.Colors.COLOR_TXT_ITEM_L1
//        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        bottomView.backgroundColor = ColorUtil.rgbColorFromHex(hex: 0xF4F4F4, alpha: 1)
        
        // 添加组件
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(levelIconView)
        addSubview(vipIconView)
        
        addSubview(sexIconView)
        addSubview(timeLabel)
//        addSubview(sourceLabel)
        
        addSubview(bottomView)
        
        // 布局
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(StatusCellMargin)
            make.left.equalTo(self.snp.left).offset(StatusCellMargin)
            make.width.equalTo(userAvatarIconNormalSize)
            make.height.equalTo(userAvatarIconNormalSize)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.top)
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.height.equalTo(26)
        }
        
        levelIconView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.top)
            make.left.equalTo(nameLabel.snp.right).offset(StatusCellMargin)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        vipIconView.snp.makeConstraints { (make) in
            make.right.equalTo(iconView.snp.right)
            make.bottom.equalTo(iconView.snp.bottom)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
        sexIconView.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.bottom.equalTo(iconView.snp.bottom)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sexIconView.snp.right).offset(StatusCellMargin/2)
            make.bottom.equalTo(iconView.snp.bottom)
        }
        
//        sourceLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(timeLabel.snp.right).offset(StatusCellMargin/2)
//            make.bottom.equalTo(iconView.snp.bottom)
//        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(StatusCellMargin)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(36)
        }
    }
}
