//
//  BalanceHistoryProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol BalanceHistoryViewProtocol {
}

protocol BalanceHistoryPresenterProtocol {
    var wireFrame : BalanceHistoryWireFrameProtocol? {get set}
    var view: BalanceHistoryViewProtocol? {get set}
    var interactor: BalanceHistoryInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol BalanceHistoryWireFrameProtocol {
}

protocol BalanceHistoryInputInteractorProtocol {
    var presenter : BalanceHistoryOutputInteractorProtocol? {get set}
}

protocol BalanceHistoryOutputInteractorProtocol {
}
