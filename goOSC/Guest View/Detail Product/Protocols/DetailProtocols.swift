//
//  DetailProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func showItem(_ data: Detail.ResponseData)
    func updateLike(_ data: Detail.ResponseData)
}

protocol DetailPresenterProtocol: AnyObject {
    var wireFrame : DetailWireFrameProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInputInteractorProtocol? {get set}
    var product: HomePage.Product? {get set}
    func viewDidLoad()
}

protocol DetailWireFrameProtocol: AnyObject {
    func routeToHomePage(from view: UIViewController)
}

protocol DetailInputInteractorProtocol: AnyObject {
    var presenter : DetailOutputInteractorProtocol? {get set}

    func insertCartToDB(_ data: HomePage.Product, _ userId: Int)
    func findDetail(_ data: HomePage.Product, _ updateLike: Bool)
    func likeProduct(_ product: HomePage.Product)
}

protocol DetailOutputInteractorProtocol: AnyObject {
    func response(_ data: Detail.Response,  _ updateLike: Bool)
}
