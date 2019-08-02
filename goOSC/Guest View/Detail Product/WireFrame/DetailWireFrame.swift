//
//  DetailWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class DetailWireFrame: DetailWireFrameProtocol {
    func routeToHomePage(from view: UIViewController) {
        guard let tabController = view.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UIViewController else {return}
        guard let homePageController = view.storyboard?.instantiateViewController(withIdentifier: "HomePage") as? HomePageView else {return}
        HomePageWireFrame.createHomePageModule(homePageController)
        view.present(tabController , animated: true, completion: nil)
    }
    class func createDetailModule(_ detailRef: DetailView, _ product: HomePage.Product?) {
        var presenter: DetailPresenterProtocol & DetailOutputInteractorProtocol = DetailPresenter()
        presenter.product = product
        detailRef.presenter = presenter
        detailRef.presenter?.wireFrame = DetailWireFrame()
        detailRef.presenter?.view = detailRef
        detailRef.presenter?.interactor = DetailInteractor()
        detailRef.presenter?.interactor?.presenter = presenter
    }
}
