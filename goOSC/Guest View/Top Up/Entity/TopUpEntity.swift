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
    
    struct User: Codable {
        var userID: Int
        var userEmail: String
        var firstName: String
        var lastName: String
        var userBalance: Double
        
        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
            case userEmail = "user_email"
            case firstName = "first_name"
            case lastName = "last_name"
            case userBalance = "user_balance"
        }
    }
}
