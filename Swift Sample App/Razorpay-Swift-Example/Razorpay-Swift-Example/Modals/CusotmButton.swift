//
//  CusotmButton.swift
//  Razorpay-Swift-Example
//
//  Created by Sachin Nautiyal on 08/07/20.
//  Copyright © 2020 Razorpay. All rights reserved.
//

import Foundation
import UIKit

class BuyButton: UIButton {
    static let defaultHeight = CGFloat(52)
    static let defaultFont = UIFont.boldSystemFont(ofSize: 20)
    var disabledColor = UIColor.lightGray
    var enabledColor = UIColor.getRazorpayColor()

    override var isEnabled: Bool {
        didSet {
            let color = isEnabled ? enabledColor : disabledColor
            setTitleColor(.white, for: UIControl.State())
            backgroundColor = color
        }
    }

    init(enabled: Bool, title: String) {
        super.init(frame: .zero)
        // Shadow
        layer.cornerRadius = 8
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 7)
        
        setTitle(title, for: UIControl.State())
        titleLabel!.font = type(of: self).defaultFont
        isEnabled = enabled
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
