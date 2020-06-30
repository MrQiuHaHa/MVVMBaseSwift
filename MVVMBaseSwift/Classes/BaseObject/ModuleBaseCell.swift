//
//  YMHelperBaseCell.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation

@objc public protocol ModuleBaseCellDelegate {
    
    /// cell 上的事件
    /// - Parameters:
    ///   - cell: 单元格实例
    ///   - tag:  被点击的按钮的tag（区分一个单元格多个按钮事件）
    func tableViewCellDidClickButtonWith(cell: ModuleBaseCell, tag: NSInteger)
}

open class ModuleBaseCell : UITableViewCell {
    
    /// 表单单元格对应的元素对象
    open var baseItem: ModuleBaseItem?
    
    /// 响应表单单元格内部事件的委托
    public weak var delegate: ModuleBaseCellDelegate?
    

    open override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        selectionStyle = .none
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        selectionStyle = .none
        
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
