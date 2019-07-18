//
//  PaypalWireframe.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class PayPalWireframe: PaypalWireFrameProtocol {
    class func createPaypalModule(_ ref: PayPalView) {
        let presenter: PaypalPresenterProtocol & PaypalOutputInteractorProtocol = PayPalPresenter()
        ref.presenter = presenter
        ref.presenter?.wireFrame = PayPalWireframe()
        ref.presenter?.view = ref
        ref.presenter?.interactor = PaypalInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
