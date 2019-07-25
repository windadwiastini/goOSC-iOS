//
//  ChatWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class ChatWireFrame: ChatWireFrameProtocol {
    class func createChatModule(_ ref: ChatView) {
        let presenter: ChatPresenterProtocol & ChatOutputInteractorProtocol = ChatPresenter()
        ref.presenter = presenter
        ref.presenter?.wireFrame = ChatWireFrame()
        ref.presenter?.view = ref
        ref.presenter?.interactor = ChatInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
