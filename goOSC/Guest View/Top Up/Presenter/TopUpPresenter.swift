//
//  TopUpPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class TopUpPresenter: TopUpPresenterProtocol {
    var wireFrame: TopUpWireFrameProtocol?
    
    var view: TopUpViewProtocol?
    
    var interactor: TopUpInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getUserDashboardData()
        interactor?.getTopUpAmount()
    }
}

extension TopUpPresenter: TopUpOutputInteractorProtocol {
    func applyUserDashboardData(_ user: TopUp.User) {
        view?.applyUserDashboardData(user)
    }
    
    func closeModal() {
        view?.closeModal()
    }
    
    func hideLoading() {
        view?.hideSpinner()
    }
    
    func showLoading() {
        view?.showSpinner()
    }
    
    func showAlert(_ resp: TopUp.ResponseAmount) {
        view?.viewAlert(data: resp)
    }
    
    func responseAmount(_ resp: TopUp.ResponseAmount) {
        view?.updateDataAmount(resp)
    }
    func signout() {
        guard let viewComponent = view as? UIViewController else {return}
        SignOut().viewDidLoad(view: viewComponent)
    }
}
