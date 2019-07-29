//
//  MMBaseMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class MMBaseMessageCell: NOCChatItemCell {
    
    var bubbleView = UIView()
    var avatarImageView = UIImageView()
    
    var isHighlight = false
    
    override class func reuseIdentifier() -> String {
        return "MMBaseMessageCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemView?.addSubview(avatarImageView)
        itemView?.addSubview(bubbleView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var layout: NOCChatItemCellLayout? {
        didSet {
            guard let cellLayout = layout as? MMBaseMessageCellLayout else {
                fatalError("invalid layout type")
            }
            
            bubbleView.frame = cellLayout.bubbleViewFrame
            avatarImageView.frame = cellLayout.avatarImageViewFrame
            avatarImageView.image = cellLayout.avatarImage
        }
    }
    
}
