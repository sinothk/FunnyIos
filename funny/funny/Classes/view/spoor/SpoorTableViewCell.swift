//
//  SpoorTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/4/25.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SpoorTableViewCell: UITableViewCell {
//    class StatusCell: UITableViewCell {
    
        private lazy var topView: SooprTopView = SooprTopView()
    
        lazy var centerLabel: UILabel = UILabel(title: "微博正文",fontSize: 14, color: UIColor.darkGray,screenInset: StatusCellMargin)
    
        private lazy var bottomView: SpoorBottomView = SpoorBottomView()
    
        var spoorEntity: SpoorEntity?{
            didSet{
                // 头部
                topView.userEntity = spoorEntity?.user
                
                // 文字内容
                centerLabel.text = spoorEntity?.contentTxt
                
                // 图片
                
                //            let num = .count
//                for ur in (viewModel?.status?.imgUrls)!{
//                    print(ur)
//                }
                
                // 底部
                selectionStyle = .none
            }
        }
    
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    // MARK:- 设置界面
    extension SpoorTableViewCell {
        private func setupUI(){
            // 1.添加组件
            contentView.addSubview(topView)
            contentView.addSubview(centerLabel)
            contentView.addSubview(bottomView)
            
            // 2.自动布局
            topView.snp.makeConstraints { (make) in
                make.top.equalTo(contentView.snp.top)
                make.left.equalTo(contentView.snp.left)
                make.right.equalTo(contentView.snp.right)
                // 高度设置
                make.height.equalTo(StatusCellMargin + StatusCellIconWidth)
            }
            
            // TODO:-
            centerLabel.snp.makeConstraints { (make) in
                make.top.equalTo(topView.snp.bottom).offset(StatusCellMargin)
                make.left.equalTo(contentView.snp.left).offset(StatusCellMargin)
                
            }
            
            // 底部视图
            bottomView.snp.makeConstraints { (make) in
                make.top.equalTo(centerLabel.snp.bottom).offset(StatusCellMargin)
                make.left.equalTo(contentView.snp.left)
                make.right.equalTo(contentView.snp.right)
                make.height.equalTo(44)
                
                // 指定下边际，辅助自动计算行高！
                make.bottom.equalTo(contentView.snp.bottom)//.offset(-StatusCellMargin)
            }
        }
}
