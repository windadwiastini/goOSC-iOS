//
//  HomePageProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol HomePageViewProtocol: class {
    func updateData(response: HomePage.Response)
}

protocol HomePagePresenterProtocol: class {
    var wireFrame : HomePageWireFrameProtocol? {get set}
    var view: HomePageViewProtocol? {get set}
    var interactor: HomePageInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol HomePageWireFrameProtocol: class {
    func routeToSignIn(from view: UIViewController)
    func routeToDetail(from view: UIViewController, with product: HomePage.Product)
}

protocol HomePageInputInteractorProtocol: class {
    var presenter : HomePageOutputInteractorProtocol? {get set}
    
    func sendHomePageRequest()
}

protocol HomePageOutputInteractorProtocol: class {
    func response(_ response: HomePage.Response)
}
