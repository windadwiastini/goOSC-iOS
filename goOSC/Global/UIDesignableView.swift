//
//  UIDesignableView.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

@IBDesignable class UIDesignableView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
