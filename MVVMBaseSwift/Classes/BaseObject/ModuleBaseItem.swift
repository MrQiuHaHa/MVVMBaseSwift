//
//  YMHelperBaseItem.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

open class ModuleBaseItem {
    
    open static func reuseCellIdentifier() -> String {
        String(describing: self)
    }
}
