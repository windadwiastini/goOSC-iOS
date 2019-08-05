//
//  SearchProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    func updateData(response: HomePage.Response)
}

protocol SearchInputInteractorProtocol: class {
    var presenter: SearchOutputInteractorProtocol? { get set }
    func sendGetProductRequest(with keyword: String)
}

protocol SearchOutputInteractorProtocol: class {
    func response(_ response: HomePage.Response)
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInputInteractorProtocol? { get set }
    var wireframe: SearchWireFrameProtocol? { get set }
    func viewDidLoad()
    
}

protocol SearchWireFrameProtocol: class {
    static func createSearchModule(with searchRef: SearchView)
    func routeToDetail(from view: UIViewController, with product: HomePage.Product)
    func routeToSignIn(from view: UIViewController)
}


