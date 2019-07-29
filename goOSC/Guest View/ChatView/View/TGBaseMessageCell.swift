//
//  TGBaseMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class TGBaseMessageCell: NOCChatItemCell {
    
    var bubbleView = UIView()
    
    var isHighlight = false
    
    override class func reuseIdentifier() -> String {
        return "TGBaseMessageCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemView?.addSubview(bubbleView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var layout: NOCChatItemCellLayout? {
        didSet {
            guard let cellLayout = layout as? TGBaseMessageCellLayout else {
                fatalError("invalid layout type")
            }
            
            bubbleView.frame = cellLayout.bubbleViewFrame
        }
    }
    
}
