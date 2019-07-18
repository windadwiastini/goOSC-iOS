//
//  PaypalProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol PaypalViewProtocol {
    func showPaypalLaman(response resp: PaypalEntity.Response)
    func dismiss(_ resp: PaypalEntity.ResponseDoPayment)
}

protocol PaypalPresenterProtocol {
    var wireFrame : PaypalWireFrameProtocol? {get set}
    var view: PaypalViewProtocol? {get set}
    var interactor: PaypalInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol PaypalWireFrameProtocol {
}

protocol PaypalInputInteractorProtocol {
    var presenter : PaypalOutputInteractorProtocol? {get set}
    func doPaymentWithPayPal()
    func doPaymentPaypal(_ ref: PaypalEntity.Response)
}

protocol PaypalOutputInteractorProtocol {
    func responsePaymentWithPayPal(_ resp: PaypalEntity.Response)
    func responseDoPaymentPaypal(_ resp: PaypalEntity.ResponseDoPayment)
}
