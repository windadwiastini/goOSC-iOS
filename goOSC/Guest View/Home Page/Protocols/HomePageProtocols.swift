//
//  HomePageProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol HomePageViewProtocol: AnyObject {
    func updateData(response: HomePage.Response)
}

protocol HomePagePresenterProtocol: AnyObject {
    var wireFrame : HomePageWireFrameProtocol? {get set}
    var view: HomePageViewProtocol? {get set}
    var interactor: HomePageInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol HomePageWireFrameProtocol: AnyObject {
    func routeToSignIn(from view: UIViewController)
    func routeToDetail(from view: UIViewController, with product: HomePage.Product)
}

protocol HomePageInputInteractorProtocol: AnyObject {
    var presenter : HomePageOutputInteractorProtocol? {get set}
    
    func sendHomePageRequest()
}

protocol HomePageOutputInteractorProtocol: AnyObject {
    func response(_ response: HomePage.Response)
}
