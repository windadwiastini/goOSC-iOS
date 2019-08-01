//
//  BalancePaymentPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import UIKit
class BalancePaymentPresenter: BalancePaymentPresenterProtocol {
    var wireFrame: BalancePaymentWireFrameProtocol?
    
    var view: BalancePaymentViewProtocol?
    
    var interactor: BalancePaymentInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.summary()
    }
    
    
}

extension BalancePaymentPresenter: BalancePaymentOutputInteractorProtocol {
    func errorAlert(_ resp: BalancePayment.FailedResponse) {
        view?.showAlertAndDismis(title: "Summary", message: resp.message)
    }
    
    func response(_ resp: BalancePayment.Response) {
        view?.updateData(response: resp)
    }
    
    func responseSuccessAlert(paymentResponse resp: BalancePayment.PaymentResponse) {
       view?.showAlertAndDismis(title: "Payment", message: resp.message)
    }
    func signout() {
        SignOut().viewDidLoad(view: view as! UIViewController)
    }
}
