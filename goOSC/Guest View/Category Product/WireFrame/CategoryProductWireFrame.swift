//
//  CategoryProductWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

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
    
    func routeToDetail(from view: UIViewController, with product: HomePage.Product) {
        guard let detailPage = view.storyboard?.instantiateViewController(withIdentifier: "productDetail") as? DetailView else {return}
        DetailWireFrame.createDetailModule(detailPage, product)
        view.present(detailPage, animated: true, completion: nil)
    }
    
    func routeToSignIn(from view: UIViewController) {
        guard let signInPage = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") as? Login else {return}
        LoginWireframe.createLoginModule(signInPage)
        view.present(signInPage, animated: true, completion: nil)
    }
    
}
