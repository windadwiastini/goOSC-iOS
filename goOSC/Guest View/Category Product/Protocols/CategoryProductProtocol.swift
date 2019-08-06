//
//  CategoryProductProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol CategoryProductViewProtocol: AnyObject {
    var presenter: CategoryProductPresenterProtocol? { get set }
    func updateData(response: HomePage.Response, category: Category.NewData)
}

protocol CategoryProductInputInteractorProtocol: AnyObject {
    var presenter: CategoryProductOutputInteractorProtocol? { get set }
    func sendGetProductRequest(with category: Category.NewData)
}

protocol CategoryProductOutputInteractorProtocol: AnyObject {
    func response(_ response: HomePage.Response, _ category: Category.NewData)
}

protocol CategoryProductPresenterProtocol: AnyObject {
    var view: CategoryProductViewProtocol? { get set }
    var interactor: CategoryProductInputInteractorProtocol? { get set }
    var wireframe: CategoryProductWireFrameProtocol? { get set }
    func viewDidLoad()
}

protocol CategoryProductWireFrameProtocol: AnyObject {
    static func createCategoryProductModule(with categoryProductRef: CategoryProductView, and category: Category.NewData)
    func routeToDetail(from view: UIViewController, with product: HomePage.Product)
    func routeToSignIn(from view: UIViewController)
}

