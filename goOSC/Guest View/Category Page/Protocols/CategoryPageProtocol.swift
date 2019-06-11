//
//  CategoryPageProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

protocol CategoryPageViewProtocol {
    var presenter: CategoryPagePresenterProtocol? { get set }
    func updateData(response: Category.Response)
}

protocol CategoryPagePresenterProtocol {
    var wireFrame: CategoryPageWireFrameProtocol? { get set }
    var interactor: CategoryPageInputInteractorProtocol? { get set }
    var view: CategoryPageViewProtocol? { get set }
    func viewDidLoad()
}

protocol CategoryPageWireFrameProtocol {
//    func createCategoryPageModule(_ categoryPageRef: CategoryPageView)
}

protocol CategoryPageInputInteractorProtocol {
    var presenter: CategoryPageOutputInteractorProtocol? { get set }
    
    func sendCategoryPageRequest()
    
}

protocol CategoryPageOutputInteractorProtocol {
    func response(_ response: Category.Response)
}
