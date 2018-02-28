//
//  CBPasswordView.swift
//  CBPasswordField
//
//  Created by 炳神 on 2017/12/4.
//  Copyright © 2017年 CBcc. All rights reserved.
//

import UIKit



class CBPasswordView: UIView {

    fileprivate var cb_frame : CGRect!
    
    var titleToplab : UILabel = UILabel()
    var topbackPwd = UIButton()
    
    init() {
        super.init(frame: CGRect.zero)
        cb_frame = frame
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        cb_frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        titleToplab.frame = CGRect(x: width(w: 27), y: height(h: 20), width: width(w: 120), height: height(h: 20))
        titleToplab.text = "输入支付密码"
        titleToplab.textColor = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 51/255.0)
        titleToplab.font = UIFont.systemFont(ofSize: 14)
        titleToplab.textAlignment = .left
        self.addSubview(titleToplab)
        
        topbackPwd.frame = CGRect(x: width(w: 27), y: height(h: 20), width: width(w: 120), height: height(h: 20))
        topbackPwd.setTitle("找回密码", for: .normal)
        topbackPwd.setTitleColor(UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 51/255.0), for: .normal)
        topbackPwd.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        topbackPwd.addTarget(self, action: #selector(topbackPwdClick), for: .touchUpInside)
    }
    
    @objc func topbackPwdClick(){
        
    }
    
}

extension CBPasswordView {
    func width(w:CGFloat)->CGFloat {
        return w * UIScreen.main.bounds.size.width / 375
    }
    func height(h:CGFloat)->CGFloat {
        return h * UIScreen.main.bounds.size.height / 667
    }
}
