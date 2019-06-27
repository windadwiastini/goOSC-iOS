//
//  TopUpEntity.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct TopUp {
    struct ResponseAmount: Decodable {
        var code: Int
        var message: String
        var data: [Int]
    }
    struct Constants {
        static let actionFileTypeHeading = "Add a File"
        static let actionFileTypeDescription = "Choose a filetype to add..."
        static let camera = "Camera"
        static let phoneLibrary = "Phone Library"
        static let video = "Video"
        static let file = "File"
        
        
        static let alertForPhotoLibraryMessage = "App does not have access to your photos. To enable access, tap settings and turn on Photo Library Access."
        
        static let alertForCameraAccessMessage = "App does not have access to your camera. To enable access, tap settings and turn on Camera."
        
        static let alertForVideoLibraryMessage = "App does not have access to your video. To enable access, tap settings and turn on Video Library Access."
        
        
        static let settingsBtnTitle = "Settings"
        static let cancelBtnTitle = "Cancel"
        
    }
    
    struct UserDashboard: Decodable {
        var code: Int
        var message: String
        var data: [User]
    }
    
    struct User: Decodable {
        var user_id: Int
        var user_email: String
        var first_name: String
        var last_name: String
        var user_balance: Double
    }
}
