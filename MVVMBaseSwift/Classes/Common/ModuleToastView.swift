//
//  YMWisdomToastView.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/3/30.
//

import Foundation

public class ModuleToastView: UIView {
    
    public enum LocationType {
        case top
        case middle
        case bottom
    }
    
    lazy var textLabel = UILabel()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = UIColor.color(hex: 0x25262D, alpha: 0.9)
        layer.cornerRadius = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("dealloc 'YMWisdomToastView' ~ ")
    }
    
    public static func showToastMsg(_ msg: String, _ type: LocationType = .bottom) {
        if msg.count == 0 { return }
        ModuleToastView().showToastMsg(msg: msg, type: type)
    }
    
    private func showToastMsg(msg: String, type: LocationType) {
        
        textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        textLabel.text = msg
        self.addSubview(textLabel)
        
        var cx: CGFloat = 0
        var cy: CGFloat = 0
        var vw: CGFloat = SCREEN_WIDTH-120
        var vh: CGFloat = 0
        let splitW: CGFloat = 20
        var labW: CGFloat = vw-splitW*2
        
        var tempH = msg.heightWith(width: labW, font: textLabel.font)
        tempH = tempH < 300 ? tempH : 300
        
        let temW = msg.widthWith(font: textLabel.font)
        
        if temW < labW {
            labW = temW
            vw = labW+40
        }
        
        cx = splitW
        cy = 10
        
        textLabel.frame = CGRect(x: cx, y: cy, width: labW, height: tempH)
        cx = (SCREEN_WIDTH-vw)/2.0
        vh = textLabel.frame.maxY + 10
        switch type {
        case .top:
            cy = CGFloat(TOP_HEIGHT)
        case .middle:
            cy = (SCREEN_HEIGHT - vh)/2.0
        case .bottom:
            cy = SCREEN_HEIGHT - vh - 60 - CGFloat(BOTTOM_HEIGHT)
        default:
            break
        }
        
        frame = CGRect(x: cx, y: cy, width: vw, height: vh)
        UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.keyWindow?.bringSubviewToFront(self)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.removeFromSuperview()
        }
        
    }

}
