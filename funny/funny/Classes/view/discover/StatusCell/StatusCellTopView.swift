//
//  StatusCellTopVIew.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/21.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class StatusCellTopView: UIView {

    var viewModel: StatusViewModel?{
        didSet{
            // 设置工作
            iconView.load.request(with: (viewModel?.status?.avatar)!)
            
            nameLabel.text = viewModel?.status?.name
            timeLabel.text = viewModel?.status?.time
            sourceLabel.text = viewModel?.status?.source
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
    // 时间
    private lazy var timeLabel:UILabel = UILabel(title: "刚刚",fontSize: 11,color: UIColor.orange)
    // 来源
    private lazy var sourceLabel:UILabel = UILabel(title: "来源",fontSize: 11)
}
extension StatusCellTopView{
    private func setupUI(){
        backgroundColor = UIColor.white//UIColor(white:0.95, alpha: 1.0)
        // 添加组件
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(levelIconView)
        addSubview(vipIconView)
        
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

        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.bottom.equalTo(iconView.snp.bottom)
        }

        sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right).offset(StatusCellMargin)
            make.bottom.equalTo(iconView.snp.bottom)
        }
    }
    
}
