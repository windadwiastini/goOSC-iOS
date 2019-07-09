//
//  VoucherWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class VoucherWireFrame: VoucherWireFrameProtocol {
    class func createVoucherModule(_ ref: Voucher) {
        let presenter: VoucherPresenterProtocol & VoucherOutputInteractorProtocol = VoucherPresenter()
        ref.presenter = presenter
        ref.presenter?.wireFrame = VoucherWireFrame()
        ref.presenter?.view = ref
        ref.presenter?.interactor = VoucherInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
