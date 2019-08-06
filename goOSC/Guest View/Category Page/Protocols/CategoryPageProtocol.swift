//
//  CategoryPageProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol CategoryPageViewProtocol:AnyObject {
    var presenter: CategoryPagePresenterProtocol? { get set }
    func updateData(response: Category.Response)
}

protocol CategoryPagePresenterProtocol: AnyObject {
    var wireFrame: CategoryPageWireFrameProtocol? { get set }
    var interactor: CategoryPageInputInteractorProtocol? { get set }
    var view: CategoryPageViewProtocol? { get set }
    func viewDidLoad()
    func showCategoryProduct(with category: Category.NewData, from view: UIViewController)
}

protocol CategoryPageWireFrameProtocol: AnyObject {
    static func createCategoryPageModule(_ categoryPageRef: CategoryPageView)
    func pushToCategoryProductPage(with category: Category.NewData,from view: UIViewController)
    func routeToSignIn(from view: UIViewController)
}

protocol CategoryPageInputInteractorProtocol: AnyObject {
    var presenter: CategoryPageOutputInteractorProtocol? { get set }
    
    func sendCategoryPageRequest()
    
}

protocol CategoryPageOutputInteractorProtocol: AnyObject {
    func response(_ response: Category.Response)
}
