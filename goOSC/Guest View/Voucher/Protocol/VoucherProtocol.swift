//
//  VoucherProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol VoucherViewProtocol {
    func showAlertSuccess(response resp: VoucherEntity.ResponseSuccess)
    func showAlertFail(response resp: VoucherEntity.ResponseFailed)
}

protocol VoucherPresenterProtocol {
    var wireFrame : VoucherWireFrameProtocol? {get set}
    var view: VoucherViewProtocol? {get set}
    var interactor: VoucherInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol VoucherWireFrameProtocol {
}

protocol VoucherInputInteractorProtocol {
    var presenter : VoucherOutputInteractorProtocol? {get set}
    func validateVoucher(voucher data: String)
}

protocol VoucherOutputInteractorProtocol {
    func responSuccess(response resp: VoucherEntity.ResponseSuccess)
    func responseFail(response resp: VoucherEntity.ResponseFailed)
}
