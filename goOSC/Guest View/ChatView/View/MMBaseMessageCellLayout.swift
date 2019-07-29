//
//  MMBaseMessageCellLayout.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class MMBaseMessageCellLayout: NSObject, NOCChatItemCellLayout {
    
    var reuseIdentifier: String = "MMBaseMessageCell"
    var chatItem: NOCChatItem
    var width: CGFloat
    var height: CGFloat = 0
    
    var message: Message {
        return chatItem as! Message
    }
    var isOutgoing: Bool {
        return message.isOutgoing
    }
    
    let bubbleViewMargin = UIEdgeInsets(top: 8, left: 52, bottom: 8, right: 52)
    var bubbleViewFrame = CGRect.zero
    let avatarSize = CGFloat(40)
    var avatarImageViewFrame = CGRect.zero
    var avatarImage: UIImage?
    
    required init(chatItem: NOCChatItem, cellWidth width: CGFloat) {
        self.chatItem = chatItem
        self.width = width
        super.init()
        self.avatarImage = self.isOutgoing ? Style.outgoingAvatarImage : Style.incomingAvatarImage
    }
    
    func calculate() {
        avatarImageViewFrame = isOutgoing ? CGRect(x: width - 8 - avatarSize, y: 11, width: avatarSize, height: avatarSize) : CGRect(x: 8, y: 11, width: avatarSize, height: avatarSize)
    }
    
    struct Style {
        static let outgoingAvatarImage = UIImage(named: "MMAvatarOutgoing")!
        static let incomingAvatarImage = UIImage(named: "MMAvatarIncoming")!
    }
    
}
