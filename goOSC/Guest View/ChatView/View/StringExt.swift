//
//  StringExt.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//
import UIKit

extension NSAttributedString {
    
    func noc_sizeThatFits(size: CGSize) -> CGSize {
        let rect = boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading ], context: nil)
        return rect.integral.size
    }
    
}
