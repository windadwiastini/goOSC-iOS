//
//  Protocols.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol BalancePaymentViewProtocol {
    func updateData(response: BalancePayment.Response)
    func showAlertAndDismis(title titleData: String, message messageData: String)
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
    func doPaymentBalance()
}

protocol BalancePaymentOutputInteractorProtocol {
    func response(_ resp : BalancePayment.Response)
    func errorAlert(_ resp: BalancePayment.FailedResponse)
    func responseSuccessAlert(paymentResponse resp: BalancePayment.PaymentResponse)
    func signout()
}
