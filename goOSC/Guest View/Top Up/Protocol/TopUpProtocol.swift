//
//  TopUpProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol TopUpViewProtocol: class {
    func updateDataAmount(_ resp: TopUp.ResponseAmount)
    func showSpinner()
    func hideSpinner()
    func viewAlert(data: TopUp.ResponseAmount)
    func closeModal()
    func applyUserDashboardData(_ user: TopUp.User)
}

protocol TopUpPresenterProtocol: class {
    var wireFrame : TopUpWireFrameProtocol? {get set}
    var view: TopUpViewProtocol? {get set}
    var interactor: TopUpInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol TopUpWireFrameProtocol: class {
}

protocol TopUpInputInteractorProtocol: class {
    var presenter : TopUpOutputInteractorProtocol? {get set}
    func getTopUpAmount()
    func getUserDashboardData()
    func submitTopup(ammount: Double, file image: UIImage)
}

protocol TopUpOutputInteractorProtocol: class {
    func responseAmount( _ resp: TopUp.ResponseAmount )
    func showAlert( _ resp: TopUp.ResponseAmount )
    func showLoading()
    func hideLoading()
    func closeModal()
    func applyUserDashboardData(_ user: TopUp.User)
    func signout()
}

