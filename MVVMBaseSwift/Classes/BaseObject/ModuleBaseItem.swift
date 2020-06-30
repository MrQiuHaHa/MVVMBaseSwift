//
//  YMHelperBaseItem.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

open class ModuleBaseItem {
    
    /// cell的行高，默认49（仅在列表子类使用）
    /// 后期可以扩展不同的基础Item，如果可以统一基础样式，根据不同的item设置不同的默认高度
    public var cellHeight: CGFloat = 49
    
    public init() {
        
    }
    
    open static func reuseCellIdentifier() -> String {
        String(describing: self)
    }
}
