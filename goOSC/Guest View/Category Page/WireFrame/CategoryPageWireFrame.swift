//
//  CategoryPageWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class CategoryPageWireFrame: CategoryPageWireFrameProtocol {

    class func createCategoryPageModule(_ categoryPageRef: CategoryPageView) {
        let presenter: CategoryPagePresenterProtocol & CategoryPageOutputInteractorProtocol = CategoryPagePresenter()
        categoryPageRef.presenter = presenter
        categoryPageRef.presenter?.wireFrame = CategoryPageWireFrame()
        categoryPageRef.presenter?.view = categoryPageRef
        categoryPageRef.presenter?.interactor = CategoryPageInteractor()
        categoryPageRef.presenter?.interactor?.presenter = presenter
    }

    
}
