//
//  UIImage+Extension.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

extension UIImage
{
    
    /// 根据颜色生成图片
    /// - Parameter color: 颜色
    open static func imageWithColor(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: 1, height: 1), false, UIScreen.main.scale)
        color.set()
        UIRectFill(CGRect.init(x: 0, y: 0, width: 1, height: 1));
        let pressedColorImg: UIImage? = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return pressedColorImg!;
    }

    
    /// 裁剪
    /// - Parameter size: 尺寸
    open func imageByCroppingImage(_ size: CGSize) -> UIImage {
        var returnImage: UIImage?
        var scaleFactor: CGFloat = 1.0
        var scaledWidth = size.width
        var scaledHeight = size.height
        var thumbnailPoint = CGPoint(x: 0, y: 0)

        if !self.size.equalTo(size) {
            let widthFactor = size.width / self.size.width
            let heightFactor = size.height / self.size.height

            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            } else {
                scaleFactor = heightFactor
            }

            scaledWidth = self.size.width * scaleFactor
            scaledHeight = self.size.height * scaleFactor

            if widthFactor > heightFactor {
                thumbnailPoint.y = (size.height - scaledHeight) * 0.5
            } else if widthFactor < heightFactor {
                thumbnailPoint.x = (size.width - scaledWidth) * 0.5
            }
        }

        UIGraphicsBeginImageContextWithOptions(size, true, 1)

        var thumbnailRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight

        self.draw(in: thumbnailRect)
        returnImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return returnImage!
    }
    
    /// 获取指定bundle的图片资源（不对其他模块使用）
    /// - Parameter name: 图片名称
    internal static func imageRecoverWith(name:String) -> UIImage? {
        
        moduleBaseImage(imgName: name, bundleName: "JRLocalResources")
    }

    // 请在自己的模块写分类调用
    open static func moduleBaseImage(imgName: String, bundleName: String) -> UIImage? {
        
        if let image = UIImage.init(named: "\(bundleName).bundle/".appending(imgName))  {
            return image
        }
        
        if let image = UIImage.init(named: imgName)  {
            return image
        }
        
        return nil
    }

}

