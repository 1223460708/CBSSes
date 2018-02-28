//
//  CBInput.swift
//  CBPasswordField
//
//  Created by 炳神 on 2017/12/1.
//  Copyright © 2017年 CBcc. All rights reserved.
//

import UIKit

class CBInput: UIControl ,UIKeyInput,UITextInputTraits{
    
    
    
    lazy var contentView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        v.isUserInteractionEnabled = false
        return v
    }()
    
    lazy var textfiled : UITextField = {
        let t = UITextField()
        t.frame = CGRect(x: 100, y: 230, width: 100, height: 49)
        t.becomeFirstResponder()
        return t
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.becomeFirstResponder()
    }
    
    init() {
        super.init(frame: CGRect.zero)
//        self.addSubview(contentView)
        self.addTarget(self, action: #selector(hangdleAction), for: .touchUpInside)
        
        self.addSubview(textfiled)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = self.bounds
        let pieceWidth = self.frame.width / 6
        let height = self.frame.height
        for i in 0..<6 {
            let lineLayer = CALayer()
            lineLayer.backgroundColor = UIColor.black.cgColor
            lineLayer.frame = CGRect(x: pieceWidth * CGFloat((i+1)) - self.layer.borderWidth / 2, y: 0, width: 1, height: height)
            self.contentView.layer.addSublayer(lineLayer)
        }
        }
        
    var hasText: Bool {
        return true
    }
    
    func insertText(_ text: String) {
        print(text)
    }
    
    func deleteBackward() {
        
    }
    
    private var keyboardType: UIKeyboardType{
        return .numberPad
    }
    override var canBecomeFocused: Bool{
//        print(canBecomeFocused)
        return true
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    
    @objc func hangdleAction(){
//        self.becomeFirstResponder()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
    
}
