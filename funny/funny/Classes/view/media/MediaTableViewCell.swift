//
//  MediaTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/4/26.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    var spoorEntity: SpoorEntity?{
        didSet{
            // 头部
//            topView.userEntity = spoorEntity?.user
//
//            // 文字内容
//            centerLabel.text = spoorEntity?.contentTxt
            
            // 图片
            for ur in (spoorEntity?.imgUrl)!{
                print(ur)
            }
            
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//MARK: 设置界面
extension MediaTableViewCell{
    func setupUI() -> Void {
        
    }
}


