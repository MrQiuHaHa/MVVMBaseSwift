//
//  UIButton+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

extension UIButton
{
    public enum ButtonImageEdgeInsetsStyle {
        ///< 上图下文字
        case imageTop
        ///< 左图右文字
        case imageLeft
        ///< 下图上文字
        case imageBottom
        ///< 右图左文字
        case imageRight
    }
    public enum GradientDirection {
        ///< 水平
        case horizontal
        ///< 垂直
        case vertical
        ///< 对角
        case Opposite
    }
    
    /// style:图片位置 space:图片与文字的距离
    
    /// 设置icon和文案的位置与间距
    /// - Parameters:
    ///   - style: 样式
    ///   - space: 间距
    open func layoutButtonImageEdgeInsetsStyle(style:ButtonImageEdgeInsetsStyle,space:CGFloat) {
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!

        var labelWidth:CGFloat = 0
        var labelHeight:CGFloat = 0

        labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
        labelHeight = (self.titleLabel?.intrinsicContentSize.height)!

        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero

        switch style {
        case .imageTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space/2.0, right: 0)
        case .imageLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
        case .imageBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0)
        case .imageRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-space/2.0, bottom: 0, right: imageWidth+space/2.0)
        default:
            break
        }

        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    
    
    /// 设置渐变色背景的按钮
    /// - Parameters:
    ///   - fromColor: 开始颜色
    ///   - toColor: 结束颜色
    ///   - direction: 渐变方向
    open func setBtnNormal(fromColor:UIColor, toColor:UIColor, direction:GradientDirection) {
        
        if(self.layer.sublayers == nil || self.layer.sublayers!.count < 2) {
            let gradientColors: [CGColor] = [fromColor.cgColor, toColor.cgColor]
            let gradientLayer: CAGradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors
            if(direction == .horizontal) {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:1, y:0)
            }else if(direction == .vertical) {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:0, y:1)
            }else {
                gradientLayer.startPoint = CGPoint(x:0, y:0)
                gradientLayer.endPoint = CGPoint(x:1, y:1)
            }
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
            
        }
    }
}
