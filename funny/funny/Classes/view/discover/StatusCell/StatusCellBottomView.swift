//
//  StatusCellBottomView.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/21.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class StatusCellBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var retweetBtn = UIButton(title: "转发",fontSize: 11,color: UIColor.darkGray,imageName: "item_icon")
    private lazy var commentBtn = UIButton(title: "评论",fontSize: 11,color: UIColor.darkGray,imageName: "item_icon")
    private lazy var likeBtn = UIButton(title: "点赞",fontSize: 11,color: UIColor.darkGray,imageName: "item_icon")
}

extension StatusCellBottomView{
    
    private func setupUI(){
        //
        backgroundColor = UIColor(white: 0.9,alpha: 1.0)
        addSubview(retweetBtn)
        addSubview(commentBtn)
        addSubview(likeBtn)
        
        //
        retweetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom)
        }

        commentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(retweetBtn.snp.top)
            make.bottom.equalTo(retweetBtn.snp.bottom)
            make.left.equalTo(retweetBtn.snp.right)

            make.width.equalTo(retweetBtn.snp.width)
        }

        likeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(commentBtn.snp.top)
            make.bottom.equalTo(commentBtn.snp.bottom)
            make.left.equalTo(commentBtn.snp.right)
            make.width.equalTo(commentBtn.snp.width)
            make.right.equalTo(self.snp.right)
        }

        //
        let sep1 = sepView()
        let sep2 = sepView()

        addSubview(sep1)
        addSubview(sep2)

        let w = 1
        let scale = 0.4

        sep1.snp.makeConstraints { (make) in
            make.left.left.equalTo(retweetBtn.snp.right)
            make.centerY.equalTo(retweetBtn.snp.centerY)
            make.width.equalTo(w)
            make.height.equalTo(retweetBtn.snp.height).multipliedBy(scale)
        }

        sep2.snp.makeConstraints { (make) in
            make.left.left.equalTo(commentBtn.snp.right)
            make.centerY.equalTo(commentBtn.snp.centerY)
            make.width.equalTo(w)
            make.height.equalTo(commentBtn.snp.height).multipliedBy(scale)
        }
    }
    
    private func sepView() -> UIView{
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        return v
    }
}

