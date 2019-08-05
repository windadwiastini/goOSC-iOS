//
//  PaypalProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol PaypalViewProtocol: class {
    func showPaypalLaman(response resp: PaypalEntity.Response)
    func dismiss(_ resp: PaypalEntity.ResponseDoPayment)
}

protocol PaypalPresenterProtocol: class {
    var wireFrame : PaypalWireFrameProtocol? {get set}
    var view: PaypalViewProtocol? {get set}
    var interactor: PaypalInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol PaypalWireFrameProtocol: class {
}

protocol PaypalInputInteractorProtocol:class {
    var presenter : PaypalOutputInteractorProtocol? {get set}
    func doPaymentWithPayPal()
    func doPaymentPaypal(_ ref: PaypalEntity.Response)
}

protocol PaypalOutputInteractorProtocol: class {
    func responsePaymentWithPayPal(_ resp: PaypalEntity.Response)
    func responseDoPaymentPaypal(_ resp: PaypalEntity.ResponseDoPayment)
}
