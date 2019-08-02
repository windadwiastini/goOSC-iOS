//
//  BalanceHistoryPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class BalanceHistoryPresenter: BalanceHistoryPresenterProtocol {
    var wireFrame: BalanceHistoryWireFrameProtocol?
    
    var view: BalanceHistoryViewProtocol?
    
    var interactor: BalanceHistoryInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.findAllBalance()
    }
}

extension BalanceHistoryPresenter: BalanceHistoryOutputInteractorProtocol {
    func response(response resp: BalancdHistory.Response) {
        view?.updateView(response: resp)
    }
    
    func signout() {
        guard let viewComponent = view as? UIViewController else {return}
        SignOut().viewDidLoad(view: viewComponent)
    }
}
