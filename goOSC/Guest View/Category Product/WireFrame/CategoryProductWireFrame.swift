//
//  CategoryProductWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class CategoryProductWireFrame: CategoryProductWireFrameProtocol {
    static func createCategoryProductModule(with categoryProductRef: CategoryProductView, and category: Category.NewData) {
        let presenter = CategoryProductPresenter()
        presenter.category = category
        categoryProductRef.presenter = presenter
        categoryProductRef.presenter?.view = categoryProductRef
        categoryProductRef.presenter?.wireframe = CategoryProductWireFrame()
        categoryProductRef.presenter?.interactor = CategoryProductInteractor()
        categoryProductRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
