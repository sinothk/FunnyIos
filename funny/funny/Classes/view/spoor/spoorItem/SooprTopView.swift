//
//  TopView.swift
//  funny
//
//  Created by gyzkhy on 2018/4/26.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SooprTopView: UIView {
    
    var userEntity : UserEntity?{
        didSet{
            // 设置工作
            iconView.show(url:(userEntity?.avatar)!)
            nameLabel.text = userEntity?.name
            
            sexIconView.image = UIImage(named: "ic_weibouser_female")
            
            timeLabel.text = "3小时前"
            
//            sourceLabel.text = viewModel?.status?.source
            //                        centerLabel.text = "Test"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 用户头像
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named:"avatar_test"))
    // 用户名
    private lazy var nameLabel:UILabel = UILabel(title: "用户名称",fontSize: 14,color: UIColor.darkGray)
    // 会员图标
    private lazy var vipIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    // 等级图标
    private lazy var levelIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    
    // 性别
    private lazy var sexIconView: UIImageView = UIImageView(image: UIImage(named:"test_2"))
    // 时间
    private lazy var timeLabel:UILabel = UILabel(title: "刚刚",fontSize: 11,color: UIColor.orange)
    // 来源
    private lazy var sourceLabel:UILabel = UILabel(title: "原创",fontSize: 11)
}

extension SooprTopView{
    private func setupUI(){
        backgroundColor = UIColor.white//UIColor(white:0.95, alpha: 1.0)
        // 添加组件
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(levelIconView)
        addSubview(vipIconView)
        
        
        addSubview(sexIconView)
        addSubview(timeLabel)
        addSubview(sourceLabel)
        
        // 布局
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(StatusCellMargin)
            make.left.equalTo(self.snp.left).offset(StatusCellMargin)
            make.width.equalTo(StatusCellIconWidth)
            make.height.equalTo(StatusCellIconWidth)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.top)
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.height.equalTo(20)
        }
        
        levelIconView.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.top)
            make.left.equalTo(nameLabel.snp.right).offset(StatusCellMargin)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        vipIconView.snp.makeConstraints { (make) in
            make.right.equalTo(iconView.snp.right)
            make.bottom.equalTo(iconView.snp.bottom)
            make.width.equalTo(12)
            make.height.equalTo(12)
        }
        
        sexIconView.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.bottom.equalTo(iconView.snp.bottom)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sexIconView.snp.right).offset(StatusCellMargin/2)
            make.bottom.equalTo(iconView.snp.bottom)
        }
        
        sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right).offset(StatusCellMargin/2)
            make.bottom.equalTo(iconView.snp.bottom)
        }
    }
}
