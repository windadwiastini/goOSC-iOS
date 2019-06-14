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
        
    }
    
    
}

extension ChatPresenter: ChatOutputInteractorProtocol {
    
}
