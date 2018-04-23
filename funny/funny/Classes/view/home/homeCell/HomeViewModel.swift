//
//  HomeViewModel.swift
//  funny
//
//  Created by gyzkhy on 2018/4/23.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import Foundation

class HomeViewModel{
    // 单例定义
    static let shared = HomeViewModel()
    // MARK：- 单例构造函数
    private init() {
    }
    
    //MARK:数据
    var status: Status?
}

extension HomeViewModel{
    // MARK: - 加载数据
    func load(page: Int, pageSize: Int) -> Array<Status>{
        let data = Array<Status>()
        
        
        return data
    }
}
