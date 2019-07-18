//
//  PaypalPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class PayPalPresenter: PaypalPresenterProtocol {
    var wireFrame: PaypalWireFrameProtocol?
    var view: PaypalViewProtocol?
    var interactor: PaypalInputInteractorProtocol?
    func viewDidLoad() {
        interactor?.doPaymentWithPayPal()
    }
    
}

extension PayPalPresenter: PaypalOutputInteractorProtocol {
    func responseDoPaymentPaypal(_ resp: PaypalEntity.ResponseDoPayment) {
        view?.dismiss(resp)
    }
    
    func responsePaymentWithPayPal(_ resp: PaypalEntity.Response) {
        view?.showPaypalLaman(response: resp)
    }
}
