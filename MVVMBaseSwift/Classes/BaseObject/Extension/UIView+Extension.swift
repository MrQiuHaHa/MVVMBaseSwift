//
//  UIView+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

extension UIView {
    
    /// 自定义控件圆角位置 如：只左上 左下有圆角
    open func addCorner(roundingCorners: UIRectCorner, cornerSize: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        layer.mask = cornerLayer
    }
}
