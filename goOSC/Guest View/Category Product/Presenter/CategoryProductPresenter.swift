//
//  CategoryProductPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class CategoryProductPresenter: CategoryProductPresenterProtocol {
    
    var view: CategoryProductViewProtocol?
    var interactor: CategoryProductInputInteractorProtocol?
    var wireframe: CategoryProductWireFrameProtocol?
    var category: Category.NewData?
    
    func viewDidLoad() {
        interactor?.sendGetProductRequest(with: category!)
    }
    
    
}

extension CategoryProductPresenter: CategoryProductOutputInteractorProtocol {
    func response(_ response: CategoryProduct.Response, _ category: Category.NewData) {
        view?.updateData(response: response, category: category)
    }
    
    
}
