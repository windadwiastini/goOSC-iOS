//
//  BalanceHistoryWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class BalanceHistoryWireFrame: BalanceHistoryWireFrameProtocol {
    class func createBalanceHistoryModule(_ ref: BalanceHistoryView) {
        let presenter: BalanceHistoryPresenterProtocol & BalanceHistoryOutputInteractorProtocol = BalanceHistoryPresenter()
        ref.presenter = presenter
        ref.presenter?.wireFrame = BalanceHistoryWireFrame()
        ref.presenter?.view = ref
        ref.presenter?.interactor = BalanceHistoryInspector()
        ref.presenter?.interactor?.presenter = presenter
    }
}
