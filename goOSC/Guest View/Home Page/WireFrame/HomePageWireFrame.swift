//
//  HomePageWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Foundation
class HomePageWireFrame: HomePageWireFrameProtocol {
    func routeToSignIn(from view: UIViewController) {
        guard let signInPage = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") as? Login else {return}
        LoginWireframe.createLoginModule(signInPage)
        view.present(signInPage, animated: true, completion: nil)
    }
    
    func routeToDetail(from view: UIViewController, with product: HomePage.Product) {
        guard let detailPage = view.storyboard?.instantiateViewController(withIdentifier: "productDetail") as? DetailView else {return}
        DetailWireFrame.createDetailModule(detailPage, product)
        view.present(detailPage, animated: true, completion: nil)
    }
    
    class func createHomePageModule(_ homePageRef: HomePageView) {
        let presenter: HomePagePresenterProtocol & HomePageOutputInteractorProtocol = HomePagePresenter()
        homePageRef.presenter = presenter
        homePageRef.presenter?.wireFrame = HomePageWireFrame()
        homePageRef.presenter?.view = homePageRef
        homePageRef.presenter?.interactor = HomePageInteractor()
        homePageRef.presenter?.interactor?.presenter = presenter
    }
}
