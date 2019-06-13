//
//  DetailProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol DetailViewProtocol {
    func showItem(_ data: Detail.ResponseData)
}

protocol DetailPresenterProtocol {
    var wireFrame : DetailWireFrameProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInputInteractorProtocol? {get set}
    var product: HomePage.Product? {get set}
    func viewDidLoad()
}

protocol DetailWireFrameProtocol {
    func routeToHomePage(from view: UIViewController)
}

protocol DetailInputInteractorProtocol {
    var presenter : DetailOutputInteractorProtocol? {get set}
    func insertCartToDB(_ data: HomePage.Product, _ userId: Int)
    func findDetail(_ data: HomePage.Product)
}

protocol DetailOutputInteractorProtocol {
    func response(_ data: Detail.Response)
}
