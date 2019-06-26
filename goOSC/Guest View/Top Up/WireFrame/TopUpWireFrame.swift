//
//  TopUpWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class TopUpWireFrame: TopUpWireFrameProtocol{
    class func createTopUpModule(_ topUpRef: TopUpView) {
        let presenter: TopUpPresenterProtocol & TopUpOutputInteractorProtocol = TopUpPresenter()
        topUpRef.presenter = presenter
        topUpRef.presenter?.wireFrame = TopUpWireFrame()
        topUpRef.presenter?.view = topUpRef
        topUpRef.presenter?.interactor = TopUpInteractor()
        topUpRef.presenter?.interactor?.presenter = presenter
    }
}
