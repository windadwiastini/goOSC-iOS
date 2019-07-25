//
//  ChatProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol ChatViewProtocol {
    func updateMessage(response resp: Chat.ResponseDetail)
}

protocol ChatInputInteractorProtocol {
    var presenter: ChatOutputInteractorProtocol? { get set }
    func detailChat(from userEmail: String, to destinationEmail: String)
}

protocol ChatOutputInteractorProtocol {
    func responseDetailChat(response resp: Chat.ResponseDetail)
}

protocol ChatPresenterProtocol {
    var wireFrame : ChatWireFrameProtocol? {get set}
    var view: ChatViewProtocol? {get set}
    var interactor: ChatInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol ChatWireFrameProtocol {
}
