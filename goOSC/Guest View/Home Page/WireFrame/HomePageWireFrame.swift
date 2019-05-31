//
//  HomePageWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class HomePageWireFrame: HomePageWireFrameProtocol {
    class func createHomePageModule(_ homePageRef: HomePageView) {
        let presenter: HomePagePresenterProtocol & HomePageOutputInteractorProtocol = HomePagePresenter()
        homePageRef.presenter = presenter
        homePageRef.presenter?.wireFrame = HomePageWireFrame()
        homePageRef.presenter?.view = homePageRef
        homePageRef.presenter?.interactor = HomePageInteractor()
        homePageRef.presenter?.interactor?.presenter = presenter
    }
}
