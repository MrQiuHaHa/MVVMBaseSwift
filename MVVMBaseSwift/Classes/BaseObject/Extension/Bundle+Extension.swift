//
//  Bundle+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/3.
//

import Foundation


public extension Bundle {
    
    open static func bundleLocal() -> Bundle? {
        let Url = Bundle.main.url(forResource: "YMLocalResources", withExtension: "bundle")
        if Url == nil {
            return nil
        } else {
            return Bundle.init(url: Url!)
        }
    }
}
