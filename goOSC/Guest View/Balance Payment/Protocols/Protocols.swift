//
//  Protocols.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol BalancePaymentViewProtocol: AnyObject {
    func updateData(response: BalancePayment.Response)
    func showAlertAndDismis(title titleData: String, message messageData: String)
}

protocol BalancePaymentPresenterProtocol: AnyObject {
    var wireFrame : BalancePaymentWireFrameProtocol? {get set}
    var view: BalancePaymentViewProtocol? {get set}
    var interactor: BalancePaymentInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol BalancePaymentWireFrameProtocol: AnyObject {
    func routeToSignIn(from view: UIViewController)
}

protocol BalancePaymentInputInteractorProtocol: AnyObject {
    var presenter : BalancePaymentOutputInteractorProtocol? {get set}
    func summary()
    func doPaymentBalance()
}

protocol BalancePaymentOutputInteractorProtocol: AnyObject {
    func response(_ resp : BalancePayment.Response)
    func errorAlert(_ resp: BalancePayment.FailedResponse)
    func responseSuccessAlert(paymentResponse resp: BalancePayment.PaymentResponse)
    func signout()
}
