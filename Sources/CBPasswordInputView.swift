//
//  CBPasswordInputView.swift
//  CBPasswordField
//
//  Created by 炳神 on 2017/12/4.
//  Copyright © 2017年 CBcc. All rights reserved.
//

import UIKit

struct pwdConfiguration {
    static public var squareWidth : CGFloat = 45.0
    static public var passWordNum : CGFloat = 6.0
    static public var rectLineColor : UIColor = UIColor.init(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    static public var pointColor : UIColor = UIColor.black
    static public var pointRadius : CGFloat = 6
}

protocol CBPasswordInputViewDelegate {
    func CBPasswordInputViewDelegatePasswordCallback(pwd:String)
}

class CBPasswordInputView: UIView {
    
    var delegate : CBPasswordInputViewDelegate!
    
    lazy var textInputFiled : UITextField = {
        let textFiled = UITextField()
        textFiled.backgroundColor = .white
        textFiled.keyboardType = .numberPad
        textFiled.becomeFirstResponder()
        textFiled.borderStyle = .none
        textFiled.addTarget(self, action: #selector(textChange), for: UIControlEvents.editingChanged)
        return textFiled
    }()
    
    fileprivate var contenView : CBContenView = {
        let view = CBContenView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.insertSubview(textInputFiled, at: 0)
        contenView.frame = self.bounds
        self.addSubview(contenView)
        contenView.layer.borderColor = UIColor.black.cgColor
        contenView.layer.borderWidth = 1
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapGesClick))
        contenView.addGestureRecognizer(tapGes)
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapGesClick(){
        cb_becomeFirstResponder()
    }

    
    func cb_becomeFirstResponder(){
        textInputFiled.becomeFirstResponder()
    }
    
    func cb_resignFirstResponder() {
        textInputFiled.resignFirstResponder()
    }
    
    @objc func textChange(textField:UITextField){
        let textCount = textField.text!.count
        if textCount > 6 {
            textInputFiled.text = cb_subString(start: 0, length: 6, str: textField.text!)
            delegate.CBPasswordInputViewDelegatePasswordCallback(pwd: textInputFiled.text!)
            return
        }
        if textCount == 6 {
            delegate.CBPasswordInputViewDelegatePasswordCallback(pwd: textInputFiled.text!)
        }
        contenView.textStr = textInputFiled.text!
        
    }
    //根据开始位置和长度截取字符串
    func cb_subString(start:Int, length:Int = -1,str:String) -> String {
        var len = length
        if len == -1 {
            len = str.count - start
        }
        let st = str.index(str.startIndex, offsetBy:start)
        let en = str.index(st, offsetBy:len)
        return String(str[st ..< en])
    }
    
}

class CBContenView: UIView {
    
    var textStr : String = "" {
        didSet {
            textNumber = textStr.count
            self.setNeedsDisplay()
        }
    }
    var textNumber : NSInteger = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        let height = rect.size.height
        let width = rect.size.width
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        for i in 0..<Int(pwdConfiguration.passWordNum) {
            context.move(to: CGPoint(x: (width / pwdConfiguration.passWordNum) * CGFloat(i), y: 0))
            context.addLine(to: CGPoint(x: (width / pwdConfiguration.passWordNum) * CGFloat(i), y: height))
            context.closePath()
        }
        context.drawPath(using: .stroke)
        
        context.setFillColor(pwdConfiguration.pointColor.cgColor)
        for i in 0..<textNumber{
            context.addArc(center: CGPoint(x: CGFloat(i + 1) * (pwdConfiguration.squareWidth / 2) + CGFloat(i) * (pwdConfiguration.squareWidth / 2), y: pwdConfiguration.squareWidth / 2), radius: pwdConfiguration.pointRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            context.drawPath(using: .fill)
        }
        
    }
}

