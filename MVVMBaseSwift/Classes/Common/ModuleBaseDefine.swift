//
//  YMHelperDefine.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/3/30.
//

import UIKit

// 类似全局宏定义
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let IS_IPHONEX = SCREEN_HEIGHT >= 812.0

let TOP_HEIGHT     =     (IS_IPHONEX ? 88.0 : 64.0)
let STATUS_BAR_HEIGHT =  (IS_IPHONEX ? 44.0 : 20.0)
let BOTTOM_HEIGHT  =     (IS_IPHONEX ? 34.0 : 0)

public func IS_IOS10() -> Bool {
    return (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0
}

