//
//  SearchWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class SearchWireFrame: SearchWireFrameProtocol {
    static func createSearchModule(with searchRef: SearchView) {
        let presenter = SearchPresenter()
        searchRef.presenter = presenter
        searchRef.presenter?.view = searchRef
        searchRef.presenter?.wireframe = SearchWireFrame()
        searchRef.presenter?.interactor = SearchInteractor()
        searchRef.presenter?.interactor?.presenter = presenter
    }
    
    func routeToDetail(from view: UIViewController, with product: HomePage.Product) {
        let detailPage = view.storyboard?.instantiateViewController(withIdentifier: "productDetail") as! DetailView
        DetailWireFrame.createDetailModule(detailPage, product)
        view.present(detailPage, animated: true, completion: nil)
    }
    
    
}
