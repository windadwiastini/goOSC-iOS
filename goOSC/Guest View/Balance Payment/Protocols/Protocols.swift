//
//  Protocols.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol BalancePaymentViewProtocol {
    func updateData(response: CartEntity.Response)
}

protocol BalancePaymentPresenterProtocol {
    var wireFrame : BalancePaymentWireFrameProtocol? {get set}
    var view: BalancePaymentViewProtocol? {get set}
    var interactor: BalancePaymentInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol BalancePaymentWireFrameProtocol {
    func routeToSignIn(from view: UIViewController)
}

protocol BalancePaymentInputInteractorProtocol {
    var presenter : BalancePaymentOutputInteractorProtocol? {get set}
    func summary()
}

protocol BalancePaymentOutputInteractorProtocol {
    func response(_ resp : CartEntity.Response)
    func errorAlert(_ resp: BalancePayment.FailedResponse)
}
