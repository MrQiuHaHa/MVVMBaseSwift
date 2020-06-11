//
//  YMHelperBaseViewModel.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

open class ModuleBaseVM: NSObject {
    
    @objc public dynamic var loading = true
    
    /// 表单数据源
    public var itemsArr: Array<ModuleBaseItem> = []
    
    /// 表单分组的数量目前只分一组，后续业务需要实现表单多组的时候再拓展
    public var numberOfSections: NSInteger {
        get {
            return 1
        }
    }
    
    /// 获取表单在某一个分组中的元素数量
    /// - Parameter section: 第几组
    open func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        itemsArr.count
    }
    
    /// 获取在特定位置的表单元素
    /// - Parameter indexPath: 第几组第几行
    open func formItemAtIndexPath(indexPath: IndexPath) -> ModuleBaseItem {
        itemsArr[indexPath.row]
    }
}
