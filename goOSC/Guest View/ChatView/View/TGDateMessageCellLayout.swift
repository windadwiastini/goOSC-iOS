//
//  TGDateMessageCellLayout.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class TGDateMessageCellLayout: NSObject, NOCChatItemCellLayout {
    
    var reuseIdentifier: String = "TGDateMessageCell"
    var chatItem: NOCChatItem
    var width: CGFloat
    var height: CGFloat = 0
    
    var message: MessageNew {
        return chatItem as! MessageNew
    }
    
    var backgroundImageViewFrame = CGRect.zero
    var backgroundImage: UIImage?
    var dateLabelFrame = CGRect.zero
    var attributedDate: NSAttributedString?
    
    required init(chatItem: NOCChatItem, cellWidth width: CGFloat) {
        self.chatItem = chatItem
        self.width = width
        super.init()
        setupBackgroundImage()
        setupAttributedDate()
        calculate()
    }
    
    func calculate() {
        height = 0
        backgroundImageViewFrame = CGRect.zero
        dateLabelFrame = CGRect.zero
        
        guard let ad = attributedDate, ad.length > 0 else {
            return
        }
        
        let limitSize = CGSize(width: ceil(width * 0.75), height: CGFloat.greatestFiniteMagnitude)
        let textLabelSize = ad.noc_sizeThatFits(size: limitSize)
        
        let vPadding = CGFloat(4)
        
        let dateLabelInsets = Style.dateInsets
        
        dateLabelFrame = CGRect(x: width/2 - textLabelSize.width/2, y: vPadding, width: textLabelSize.width, height: textLabelSize.height)
        
        backgroundImageViewFrame = CGRect(x: dateLabelFrame.origin.x - dateLabelInsets.left, y: dateLabelFrame.origin.y - dateLabelInsets.top, width: dateLabelFrame.width + dateLabelInsets.left + dateLabelInsets.right, height: dateLabelFrame.height + dateLabelInsets.top + dateLabelInsets.bottom)
        
        height = vPadding * 2 + backgroundImageViewFrame.height
    }
    
    private func setupBackgroundImage() {
        backgroundImage = TGSystemMessageCellLayout.Style.systemMessageBackground
    }
    
    private func setupAttributedDate() {
        let dateString = Style.dateFormatter.string(from: message.date)
        let one = NSAttributedString(string: dateString, attributes: [NSFontAttributeName: Style.dateFont, NSForegroundColorAttributeName: Style.dateColor])
        attributedDate = one
    }
    
    struct Style {
        static let dateInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        static let dateFont = UIFont.systemFont(ofSize: 13)
        static let dateColor = UIColor.white
        static let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.locale = Locale(identifier: "en_US")
            df.dateFormat = "MMMM dd"
            return df
        }()
    }
    
}
