//
//  YMHelperTableViewVController.swift
//  Pods
//
//  Created by 邱俊荣 on 2020/4/1.
//

import Foundation
import MJRefresh
import SnapKit

open class ModuleTableViewVC: ModuleBaseVC,UITableViewDelegate,UITableViewDataSource,ModuleBaseCellDelegate {

    
    public lazy var tableView = UITableView()
    
    /// 是否支持下拉刷新，默认不支持
    public var isSupportHeaderRefresh: Bool = false {
        willSet {
            if newValue == true {
                tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refreshDataLoading))
            }
        }
    }
    
    /// 是否支持上拉加载更多，默认不支持
    public var isSupportFooterRefresh: Bool = false {
        willSet {
            if newValue == true {
                let footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
                footer.setTitle("正在加载更多", for: .refreshing)
                footer.setTitle("没有更多数据", for: .noMoreData)
                footer.setTitle("点击或上拉加载更多", for: .idle)
                footer.stateLabel?.font = UIFont.systemFont(ofSize: 10.0)
                footer.stateLabel?.textColor = UIColor.color(hex: 0x999999)
                tableView.mj_footer = footer
                hiddenFooterRefresh = true //默认隐藏底部刷新控件
            }
        }
    }
    
    /// 隐藏底部刷新（列表请求到有数据的时候设置显示，无数据则应该隐藏）
    public var hiddenFooterRefresh: Bool = false {
        willSet {
            tableView.mj_footer?.isHidden = newValue
        }
    }
    
    public var hasMore: Bool = true
    public var loadMore: Bool = false
    public var pageIndex: NSInteger = 0
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(-BOTTOM_HEIGHT)
        })
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    @objc open func refreshDataLoading() {
        loadMore = false
        hasMore = true
        pageIndex = 0
        tableView.mj_header?.endRefreshing()
        tableView.mj_footer?.resetNoMoreData()
    }
    
    @objc open func loadMoreData() {
        
        tableView.mj_footer?.endRefreshing()
        if hasMore == false {
            tableView.mj_footer?.endRefreshingWithNoMoreData()
            return
        }
        loadMore = true
        pageIndex += 1
    }
    
    open func tableViewCellDidClickButtonWith(cell: ModuleBaseCell, tag: NSInteger) {}
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 0 }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
}
