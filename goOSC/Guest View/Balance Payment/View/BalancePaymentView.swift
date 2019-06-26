//
//  BalancePaymentView.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class BalancePaymentView: UIViewController, BalancePaymentViewProtocol {
    var presenter: BalancePaymentPresenterProtocol?
    func updateData(response: CartEntity.Response) {}
    override func viewDidLoad() {
        super.viewDidLoad()
        BalancePaymentWireFrame.createBalancePaymentModule(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
}
