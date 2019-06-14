//
//  CategoryPageProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol CategoryPageViewProtocol {
    var presenter: CategoryPagePresenterProtocol? { get set }
    func updateData(response: Category.Response)
}

protocol CategoryPagePresenterProtocol {
    var wireFrame: CategoryPageWireFrameProtocol? { get set }
    var interactor: CategoryPageInputInteractorProtocol? { get set }
    var view: CategoryPageViewProtocol? { get set }
    func viewDidLoad()
    func showCategoryProduct(with category: Category.NewData, from view: UIViewController)
}

protocol CategoryPageWireFrameProtocol {
    static func createCategoryPageModule(_ categoryPageRef: CategoryPageView)
    func pushToCategoryProductPage(with category: Category.NewData,from view: UIViewController)
    func routeToSignIn(from view: UIViewController)
}

protocol CategoryPageInputInteractorProtocol {
    var presenter: CategoryPageOutputInteractorProtocol? { get set }
    
    func sendCategoryPageRequest()
    
}

protocol CategoryPageOutputInteractorProtocol {
    func response(_ response: Category.Response)
}
