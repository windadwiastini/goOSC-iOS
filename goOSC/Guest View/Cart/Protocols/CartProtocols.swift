//
//  CartProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol CartViewProtocol {
    func updateData(response: [CartEntity.SingleCart])
}

protocol CartPresenterProtocol {
    var wireFrame : CartWireFrameProtocol? {get set}
    var view: CartViewProtocol? {get set}
    var interactor: CartInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol CartWireFrameProtocol {
    func routeToSignIn(from view: UIViewController)
}

protocol CartInputInteractorProtocol {
    var presenter : CartOutputInteractorProtocol? {get set}
    func findAllData() 
}

protocol CartOutputInteractorProtocol {
    func response(_ resp : [CartEntity.SingleCart])
}
