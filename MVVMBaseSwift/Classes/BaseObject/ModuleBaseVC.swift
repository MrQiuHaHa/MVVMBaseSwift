//
//  YMHelperBaseVController.swift
//  FDFullscreenPopGesture
//
//  Created by 邱俊荣 on 2020/3/30.
//

import Foundation
import FDFullscreenPopGesture

open class ModuleBaseVC: UIViewController{
    
    /// VC之间参数传递
    public var parm: Dictionary<String,Any>?
    
    /// 是否展示无数据/异常页面
    public var showNoMessageStyle: Bool? {
        willSet {
            if let val = newValue  {
                errorView.isHidden = !val
            }
        }
    }
    
    /// 无数据/异常显示图片
    public var errorImage: UIImage?
    
    public var errorTips: String?
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        fd_prefersNavigationBarHidden = false
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 13, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
            UIApplication.shared.statusBarStyle = .default
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            self.setNavigationBar()
        }
        
        setLeftBackBtn()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    deinit {
        print(" *** dealloc *** : \(self)")
    }
    
    lazy var errorView: UIView = {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 155, width: SCREEN_WIDTH, height: 185)
        view.backgroundColor = UIColor.clear
        let image = errorImage == nil ? UIImage.imageRecoverWith(name: "BaseErrorTip_Image") : errorImage
        let imageV = UIImageView(frame: CGRect(x: (SCREEN_WIDTH-135)/2.0, y: 0, width: 135, height: 135))
        imageV.image = image
        view.addSubview(imageV)
        
        let errorLab = UILabel(frame: CGRect(x: 15, y: imageV.frame.maxY, width: SCREEN_WIDTH-30, height: 50))
        errorLab.text = errorTips == nil ? "暂无数据" : errorTips!
        errorLab.textAlignment = .center
        errorLab.textColor = UIColor.color(hex: 0x666666)
        errorLab.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(errorLab)
        
        view.isHidden = true
        
        return view
    }()
    
}


/// MARK - 导航栏相关的设置
extension ModuleBaseVC
{
    
    public func setLeftBackBtn() {
        
        var x: CGFloat = 0
        if #available(iOS 13, *) {
            x = 0
        }else {
            x = 8
        }
        let btn: UIButton = UIButton.init(frame: CGRect.init(x: x, y: 0, width: 40, height: 40))
        btn.addTarget(self, action: #selector(onBackButtonClick), for: .touchUpInside)
        let imageV: UIImageView = UIImageView.init(image: UIImage.imageRecoverWith(name: "YMNavigationBar_Left_back"))
        imageV.frame = CGRect.init(x: x, y: 0, width: 24, height: 40)
        imageV.contentMode = .center
        btn.addSubview(imageV)
        let view: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 40+16, height: 40))
        view.addSubview(btn)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: view)
        
    }
    /// 导航返回事件
    @objc open func onBackButtonClick() {
        let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        nav?.popViewController(animated: true)
    }
    
    
    /// 设置导航栏
    public func setNavigationBar() {
        
        edgesForExtendedLayout = .bottom ///视图是否覆盖到四周的区域 UIRectEdgeNone视图控制器将在导航栏下方不会被覆盖
        extendedLayoutIncludesOpaqueBars = true
        modalPresentationCapturesStatusBarAppearance = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.black]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage.imageRecoverWith(name: "YMNavigationBar_Bottom_line")
    }
    
    /// 设置右按钮
    /// - Parameter imageStr: 图片名字
    public func setRightBtnImage(imageStr : String) {
        
        var x: CGFloat = 0
        if #available(iOS 13, *) {
            x = 16
        }else {
            x = 8
        }
        let btn: UIButton = UIButton.init(frame: CGRect.init(x: x, y: 0, width: 40, height: 40))
        btn.addTarget(self, action: #selector(onRightButtonClick), for: .touchUpInside)
        let imageV: UIImageView = UIImageView.init(image: UIImage.imageRecoverWith(name: imageStr))
        imageV.frame = CGRect.init(x: x, y: 0, width: 24, height: 40)
        imageV.contentMode = .center
        btn.addSubview(imageV)
        let view: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 40+16, height: 40))
        view.addSubview(btn)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: view)
    }
    
    /// 右按钮事件
    @objc open func onRightButtonClick() {}
    
}
