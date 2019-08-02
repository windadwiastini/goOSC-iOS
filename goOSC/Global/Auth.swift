//
//  Auth.swift
//  goOSC
//
//  Created by Bootcamp on 25/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class Auth {
    let token:String = UserDefaults.standard.string(forKey: "token") ?? ""
    let email:String = UserDefaults.standard.string(forKey: "email") ?? ""
    let firstName:String = UserDefaults.standard.string(forKey: "firstname") ?? ""
    let lastName:String = UserDefaults.standard.string(forKey: "lastname") ?? ""
}
