//
//  ChatViewNew.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//
import UIKit
import NoChat
class ChatViewNew:  NOCChatViewController {
    override class func cellLayoutClass(forItemType type: String) -> Swift.AnyClass? {
        if type == "Text" {
            return MMTextMessageCellLayout.self
        } else if type == "Date" {
            return MMDateMessageCellLayout.self
        } else if type == "System" {
            return MMSystemMessageCellLayout.self
        } else {
            return nil
            
        }
    
    override class func inputPanelClass() -> Swift.AnyClass? {
        return MMChatInputTextPanel.self
    }
    
    override func registerChatItemCells() {
        collectionView?.register(MMTextMessageCell.self, forCellWithReuseIdentifier: MMTextMessageCell.reuseIdentifier())
        collectionView?.register(MMDateMessageCell.self, forCellWithReuseIdentifier: MMDateMessageCell.reuseIdentifier())
        collectionView?.register(MMSystemMessageCell.self, forCellWithReuseIdentifier: MMSystemMessageCell.reuseIdentifier())
        
        }
}
