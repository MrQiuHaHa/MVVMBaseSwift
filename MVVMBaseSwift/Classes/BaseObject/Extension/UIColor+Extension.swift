//
//  UIColor+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

//MARK: UIColor
extension UIColor{

    /// 根据十六进制数字创建颜色
    ///
    /// - Parameters:
    ///   - hex: 十六进制数值
    ///   - alpha: 透明度
    /// - Returns: color 值
    open static func color(hex: Int32, alpha: CGFloat = 1.0) -> UIColor{
        let r =  CGFloat((hex & 0xFF0000) >> 16)
        let g =  CGFloat((hex & 0x00FF00) >> 8)
        let b =  CGFloat(hex & 0x0000FF)
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
}
