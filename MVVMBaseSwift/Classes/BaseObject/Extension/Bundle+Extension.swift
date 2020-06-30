//
//  Bundle+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/3.
//

import Foundation


public extension Bundle {
    
    // 请在自己的模块写分类调用
    open static func moduleBaseBundleLocal(resource: String) -> Bundle? {
        let Url = Bundle.main.url(forResource: resource, withExtension: "bundle")
        if Url == nil {
            return nil
        } else {
            return Bundle.init(url: Url!)
        }
    }
}
