//
//  String+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/4.
//

import Foundation


public extension String {
    
    /// String的高度计算
    /// - Parameters:
    ///   - width: 设定宽度前提
    ///   - lineSpacing: 设定行高前提
    ///   - font: 设定字体前提
    public func heightWith(width: CGFloat, lineSpacing: CGFloat = 1.5, font: UIFont) -> CGFloat {
        
        let str = self as! NSString
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        let size = str.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.paragraphStyle:paragraphStyle,NSAttributedString.Key.font:font], context: nil).size
        return size.height
    }
    
    
    /// String的宽度计算
    /// - Parameter font: 设定字体前提
    public func widthWith(font: UIFont) -> CGFloat {
        let str = self as! NSString
        return str.size(withAttributes: [NSAttributedString.Key.font:font]).width
    }
}
