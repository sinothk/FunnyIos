//
//  SpoorTableViewCell.swift
//  funny
//
//  Created by gyzkhy on 2018/4/25.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SpoorTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 底部
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
