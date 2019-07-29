//
//  MMSystemMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class MMSystemMessageCell: NOCChatItemCell {
    
    var backgroundImageView = UIImageView()
    var textLabel = UILabel()
    
    override class func reuseIdentifier() -> String {
        return "MMSystemMessageCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemView?.addSubview(backgroundImageView)
        
        textLabel.numberOfLines = 0
        itemView?.addSubview(textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var layout: NOCChatItemCellLayout? {
        didSet {
            guard let cellLayout = layout as? MMSystemMessageCellLayout else {
                fatalError("invalid layout type")
            }
            
            backgroundImageView.frame = cellLayout.backgroundImageViewFrame
            backgroundImageView.image = cellLayout.backgroundImage
            textLabel.frame = cellLayout.textLabelFrame
            textLabel.attributedText = cellLayout.attributedText
        }
    }
    
}
