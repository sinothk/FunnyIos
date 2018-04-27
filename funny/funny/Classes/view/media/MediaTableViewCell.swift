//
//  MediaTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/4/26.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    var nineGridView = HxNineGridView()
    
    var spoorEntity: SpoorEntity?{
        didSet{
            // 头部
//            topView.userEntity = spoorEntity?.user
//
//            // 文字内容
//            centerLabel.text = spoorEntity?.contentTxt
            
            // 图片
            
//            let imageSrcs: [String] = ["http://upload1.techweb.com.cn/s/139/2018/0322/1521684876525.jpg",
//                                       "http://upload1.techweb.com.cn/s/139/2018/0322/1521684917565.png",
//                                       "http://upload1.techweb.com.cn/s/139/2018/0322/1521686276466.jpg",
//                                       "http://upload1.techweb.com.cn/s/139/2018/0322/1521686348168.jpg"]

//            for index in 0..<(spoorEntity?.imgUrl)!.count {
//                print("\(index) times 5 is \(index * 5)")
//
//                imageSrcs[index] = (spoorEntity?.imgUrl)!.
//            }
            
//            for ur in (spoorEntity?.imgUrl)!{
//                print(ur)
//            }
            
            nineGridView.imageSrcs = (spoorEntity?.imageSrcs)!
            
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
//        addSubview(nineGridView)
//
//        // 布局
//        nineGridView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(StatusCellMargin)
//            make.left.equalTo(self.snp.left).offset(StatusCellMargin)
//            make.right.equalTo(self.snp.right).offset(StatusCellMargin)
//            make.bottom.equalTo(self.snp.bottom).offset(StatusCellMargin)
//
//            make.width.equalTo(300)
//            make.height.equalTo(300)
//        }
        
//        self.contentView.addSubview(nineGridView)
//
//        nineGridView.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(self.contentView).offset(10)
//            make.leading.equalTo(self.contentView).offset(25)
//            make.trailing.equalTo(self.contentView).offset(-25)
//        }
        
//        nineGridView.width = UIScreen.main.bounds.size.width - 50 // 这里减去的值为leading+trailing （根据你自己的排版去调整）
   
    
        let nineGridView = HxNineGridView()
        
        self.contentView.addSubview(nineGridView)

        nineGridView.snp.makeConstraints { (make) -> Void in
            
            make.top.equalTo(self.contentView).offset(10)
            
            make.leading.equalTo(self.contentView).offset(25)
            
            make.trailing.equalTo(self.contentView).offset(-25)
            
        }
 
        nineGridView.width = UIScreen.main.bounds.size.width - 50 // 这里减去的值为leading+trailing （根据你自己的排版去调整）
        
        nineGridView.imageSrcs = ["http://106.14.132.45:80/app/k_english/file/web/image/2018/02/20/2018-02-20-20-E50FC3E161CEF970F1F0F78D7B80EB95.jpg", "http://106.14.132.45:80/app/k_english/file/web/image/2018/02/20/2018-02-20-20-79E3CACCC31EDCF4FCEAF5F595C0FEBC.jpg", "http://106.14.132.45:80/app/k_english/file/web/image/2018/02/20/2018-02-20-20-82A0DB130A0436A510E3CA17B4D458FD.jpg"]
    
    }
}


