//
//  HomePageProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol HomePageViewProtocol {
//    func openAlert(_ title: String, _ context: String)
}

protocol HomePagePresenterProtocol {
    var wireFrame : HomePageWireFrameProtocol? {get set}
    var view: HomePageViewProtocol? {get set}
    var interactor: HomePageInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol HomePageWireFrameProtocol {
}

protocol HomePageInputInteractorProtocol {
    var presenter : HomePageOutputInteractorProtocol? {get set}
}

protocol HomePageOutputInteractorProtocol {
//    func response(_ resp: Customer.Response )
}
