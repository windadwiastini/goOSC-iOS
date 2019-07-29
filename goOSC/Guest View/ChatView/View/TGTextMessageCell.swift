//
//  TGTextMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat
import YYText

class TGTextMessageCell: TGBaseMessageCell {
    
    var bubbleImageView = UIImageView()
    var textLabel = YYLabel()
    var timeLabel = UILabel()
    var deliveryStatusView = TGDeliveryStatusView()
    
    override class func reuseIdentifier() -> String {
        return "TGTextMessageCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bubbleView.addSubview(bubbleImageView)
        
        textLabel.textVerticalAlignment = .top
        textLabel.displaysAsynchronously = true
        textLabel.ignoreCommonProperties = true
        textLabel.fadeOnAsynchronouslyDisplay = false
        textLabel.fadeOnHighlight = false
        textLabel.highlightTapAction = { [weak self] (containerView, text, range, rect) -> Void in
            if range.location >= text.length { return }
            let highlight = text.yy_attribute(YYTextHighlightAttributeName, at: UInt(range.location)) as! YYTextHighlight
            guard let info = highlight.userInfo, info.count > 0 else { return }
            
            guard let strongSelf = self else { return }
            if let d = strongSelf.delegate as? TGTextMessageCellDelegate {
                d.didTapLink(cell: strongSelf, linkInfo: info)
            }
        }
        bubbleView.addSubview(textLabel)
        
        bubbleImageView.addSubview(timeLabel)
        
        bubbleImageView.addSubview(deliveryStatusView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var layout: NOCChatItemCellLayout? {
        didSet {
            guard let cellLayout = layout as? TGTextMessageCellLayout else {
                fatalError("invalid layout type")
            }
            
            bubbleImageView.frame = cellLayout.bubbleImageViewFrame
            bubbleImageView.image = isHighlight ? cellLayout.highlightBubbleImage : cellLayout.bubbleImage
            
            textLabel.frame = cellLayout.textLableFrame
            textLabel.textLayout = cellLayout.textLayout
            
            timeLabel.frame = cellLayout.timeLabelFrame
            timeLabel.attributedText = cellLayout.attributedTime
            
            deliveryStatusView.frame = cellLayout.deliveryStatusViewFrame
            deliveryStatusView.deliveryStatus = cellLayout.message.deliveryStatus
        }
    }
    
}

protocol TGTextMessageCellDelegate: NOCChatItemCellDelegate {
    func didTapLink(cell: TGTextMessageCell, linkInfo: [AnyHashable: Any])
}
