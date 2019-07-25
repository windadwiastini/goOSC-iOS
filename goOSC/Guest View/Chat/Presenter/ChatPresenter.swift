//
//  ChatPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class ChatPresenter: ChatPresenterProtocol {
    var wireFrame: ChatWireFrameProtocol?
    
    var view: ChatViewProtocol?
    
    var interactor: ChatInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.detailChat(from: Auth().email, to: "admin@goosc.com")
    }
}

extension ChatPresenter: ChatOutputInteractorProtocol {
    func responseDetailChat(response resp: Chat.ResponseDetail) {
        view?.updateMessage(response: resp)
    }
}
