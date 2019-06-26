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
        print("presenter view did load")
        interactor?.summary()
    }
    
    
}

extension BalancePaymentPresenter: BalancePaymentOutputInteractorProtocol {
    func errorAlert(_ resp: BalancePayment.FailedResponse) {
        let vs: UIViewController = view as! UIViewController
        let alert = UIAlertController(title: "Summary", message: resp.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            vs.dismiss(animated: true, completion: nil)
        }))
        vs.present(alert, animated: true)
    }
    
    func response(_ resp: CartEntity.Response) {}
}
