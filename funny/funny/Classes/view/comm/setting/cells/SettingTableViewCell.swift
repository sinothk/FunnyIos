//
//  SettingTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/5/2.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
//    var indexPath: IndexPath?{
//
//        didSet{
//            let secno = indexPath?.section
//            let row = indexPath?.row
//            //            print("选中\(secno ?? 0)组，\(indexPath?.row ?? 0)")
//
//            if secno == 0 {
//                if row == 0{
//                    nameLabel.text = "设置"
//                }else{
//                    nameLabel.text = "设置1111"
//                }
//            } else if secno == 1{
//                nameLabel.text = "设置222"
//            }
//
//            // 底部
//            selectionStyle = .none
//        }
//    }
    
    var itemInfo: SettingItemEntity?{
        
        didSet{
            iconView.image = UIImage(named: (itemInfo?.itemIocn)! )
            nameLabel.text = itemInfo?.itemName
            
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

    // 用户头像
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named:"avatar_test"))
    // 用户名
    private lazy var nameLabel:UILabel = UILabel(title: "用户名称",fontSize: 14,color: UIColor.orange)
    
    func setupUI() -> Void {
        
        nameLabel.textColor = Constants.Colors.COLOR_TXT_ITEM_L1
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        // 添加组件
        addSubview(iconView)
        addSubview(nameLabel)
        
        // 布局
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(StatusCellMargin)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(StatusCellIconWidth*0.8)
            make.height.equalTo(StatusCellIconWidth*0.8)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconView.snp.centerY)
            make.left.equalTo(iconView.snp.right).offset(StatusCellMargin)
            make.height.equalTo(20)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
