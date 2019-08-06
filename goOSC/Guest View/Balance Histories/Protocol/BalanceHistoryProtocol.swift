//
//  BalanceHistoryProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol BalanceHistoryViewProtocol: AnyObject {
    func updateView(response resp: BalancdHistory.Response)
}

protocol BalanceHistoryPresenterProtocol: AnyObject {
    var wireFrame : BalanceHistoryWireFrameProtocol? {get set}
    var view: BalanceHistoryViewProtocol? {get set}
    var interactor: BalanceHistoryInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol BalanceHistoryWireFrameProtocol: AnyObject {
}

protocol BalanceHistoryInputInteractorProtocol: AnyObject {
    var presenter : BalanceHistoryOutputInteractorProtocol? {get set}
    func findAllBalance()
}

protocol BalanceHistoryOutputInteractorProtocol: AnyObject {
    func response(response resp: BalancdHistory.Response)
    func signout()
}
