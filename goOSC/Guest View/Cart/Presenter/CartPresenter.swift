//
//  CartPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class CartPresenter: CartPresenterProtocol {
    var wireFrame: CartWireFrameProtocol?
    
    var view: CartViewProtocol?
    
    var interactor: CartInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.findAllData()
    }
    
    
}

extension CartPresenter: CartOutputInteractorProtocol {
    func response(_ resp : [CartEntity.SingleCart]) {
        print(resp)
        view?.updateData(response: resp)
    }
}
