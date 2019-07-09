//
//  VoucherPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class VoucherPresenter: VoucherPresenterProtocol {
    var wireFrame: VoucherWireFrameProtocol?
    var view: VoucherViewProtocol?
    var interactor: VoucherInputInteractorProtocol?
    
    func viewDidLoad() {
    }
}

extension VoucherPresenter: VoucherOutputInteractorProtocol {
    func responSuccess(response resp: VoucherEntity.ResponseSuccess) {
        view?.showAlertSuccess(response: resp)
    }
    
    func responseFail(response resp: VoucherEntity.ResponseFailed) {
        view?.showAlertFail(response: resp)
    }
}
