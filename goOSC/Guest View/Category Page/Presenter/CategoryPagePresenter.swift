//
//  CategoryPagePresenter.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class CategoryPagePresenter: CategoryPagePresenterProtocol {
    
    var wireFrame: CategoryPageWireFrameProtocol?
    var interactor: CategoryPageInputInteractorProtocol?
    var view: CategoryPageViewProtocol?
    
    func viewDidLoad() {
        interactor?.sendCategoryPageRequest()
    }
    
    
}

extension CategoryPagePresenter: CategoryPageOutputInteractorProtocol {
    func response(_ response: Category.Response) {
        view?.updateData(response: response)
    }
    
    
}
