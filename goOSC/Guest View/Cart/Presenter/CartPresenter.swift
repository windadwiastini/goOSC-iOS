//
//  CartPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class CartPresenter: CartPresenterProtocol {
    var wireFrame: CartWireFrameProtocol?
    
    var view: CartViewProtocol?
    
    var interactor: CartInputInteractorProtocol?
    
    func viewDidLoad() {
        print("print all data")
        interactor?.findAllData()
    }
}
extension CartPresenter: CartOutputInteractorProtocol {
    func response(_ resp : CartEntity.Response) {
        view?.updateData(response: resp)
    }
    
    func signout() {
        guard let viewComponent = view as? UIViewController else {return}
        SignOut().viewDidLoad(view: viewComponent)
    }
}
