//
//  TGDateMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class TGDateMessageCell: NOCChatItemCell {
    
    var backgroundImageView = UIImageView()
    var dateLabel = UILabel()
    
    override class func reuseIdentifier() -> String {
        return "TGDateMessageCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemView?.addSubview(backgroundImageView)
        
        dateLabel.numberOfLines = 0
        itemView?.addSubview(dateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var layout: NOCChatItemCellLayout? {
        didSet {
            guard let cellLayout = layout as? TGDateMessageCellLayout else {
                fatalError("invalid layout type")
            }
            
            backgroundImageView.frame = cellLayout.backgroundImageViewFrame
            backgroundImageView.image = cellLayout.backgroundImage
            dateLabel.frame = cellLayout.dateLabelFrame
            dateLabel.attributedText = cellLayout.attributedDate
        }
    }
    
}
