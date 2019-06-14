//
//  CategoryPageWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class CategoryPageWireFrame: CategoryPageWireFrameProtocol {
    static func createCategoryPageModule(_ categoryPageRef: CategoryPageView) {
        let presenter: CategoryPagePresenterProtocol & CategoryPageOutputInteractorProtocol = CategoryPagePresenter()
        categoryPageRef.presenter = presenter
        categoryPageRef.presenter?.wireFrame = CategoryPageWireFrame()
        categoryPageRef.presenter?.view = categoryPageRef
        categoryPageRef.presenter?.interactor = CategoryPageInteractor()
        categoryPageRef.presenter?.interactor?.presenter = presenter
    }
    
    func pushToCategoryProductPage(with category: Category.NewData, from view: UIViewController) {
        print("masuk push to category")
        let categoryProductViewController = view.storyboard?.instantiateViewController(withIdentifier: "CategoryProduct") as! CategoryProductView
        CategoryProductWireFrame.createCategoryProductModule(with: categoryProductViewController, and: category)
//        view.navigationController?.pushViewController(categoryProductViewController, animated: true)
        view.present(categoryProductViewController, animated: true, completion: nil)
        
    }
    
    func routeToSignIn(from view: UIViewController) {
        let signInPage = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! Login
        LoginWireframe.createLoginModule(signInPage)
        view.present(signInPage, animated: true, completion: nil)
    }
}
