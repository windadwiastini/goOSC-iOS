//
//  BalancePaymentWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class BalancePaymentWireFrame: BalancePaymentWireFrameProtocol {
    func routeToSignIn(from view: UIViewController) {}
    
    class func createBalancePaymentModule(_ bpRef: BalancePaymentView) {
        let presenter: BalancePaymentPresenterProtocol & BalancePaymentOutputInteractorProtocol = BalancePaymentPresenter()
        bpRef.presenter = presenter
        bpRef.presenter?.wireFrame = BalancePaymentWireFrame()
        bpRef.presenter?.view = bpRef
        bpRef.presenter?.interactor = BalancePaymentInteractor()
        bpRef.presenter?.interactor?.presenter = presenter
    }
}
