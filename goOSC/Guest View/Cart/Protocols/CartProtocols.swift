//
//  CartProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol CartViewProtocol: AnyObject {
    func updateData(response: CartEntity.Response)
}

protocol CartPresenterProtocol: AnyObject {
    var wireFrame : CartWireFrameProtocol? {get set}
    var view: CartViewProtocol? {get set}
    var interactor: CartInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol CartWireFrameProtocol: AnyObject {
    func routeToSignIn(from view: UIViewController)
}

protocol CartInputInteractorProtocol: AnyObject {
    var presenter : CartOutputInteractorProtocol? {get set}
    func findAllData()
    func deleteData(_ data: CartEntity.SingleCart) 
}

protocol CartOutputInteractorProtocol: AnyObject {
    func response(_ resp : CartEntity.Response)
    func signout()
}
