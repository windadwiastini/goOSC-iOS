//
//  CategoryProductProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

protocol CategoryProductViewProtocol {
    var presenter: CategoryProductPresenterProtocol? { get set }
    func updateData(response: CategoryProduct.Response, category: Category.NewData)
}

protocol CategoryProductInputInteractorProtocol {
    var presenter: CategoryProductOutputInteractorProtocol? { get set }
    func sendGetProductRequest(with category: Category.NewData)
}

protocol CategoryProductOutputInteractorProtocol {
    func response(_ response: CategoryProduct.Response, _ category: Category.NewData)
}

protocol CategoryProductPresenterProtocol {
    var view: CategoryProductViewProtocol? { get set }
    var interactor: CategoryProductInputInteractorProtocol? { get set }
    var wireframe: CategoryProductWireFrameProtocol? { get set }
    func viewDidLoad()
}

protocol CategoryProductWireFrameProtocol {
    static func createCategoryProductModule(with categoryProductRef: CategoryProductView, and category: Category.NewData)
}

