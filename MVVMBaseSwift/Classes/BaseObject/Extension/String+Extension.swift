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
    
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[2] // c
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    // 截取 从头到i位置
    func substring(to:Int) -> String{
        return self[0..<to]
    }
    // 截取 从i到尾部
    func substring(from:Int) -> String{
        return self[from..<self.count]
    }
}
