//
//  Auth.swift
//  goOSC
//
//  Created by Bootcamp on 25/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class Auth {
    let token: String = UserDefaults.standard.value(forKey: "token")! as! String
    let email:String = UserDefaults.standard.value(forKey: "email")! as! String
    let firstName:String = UserDefaults.standard.value(forKey: "firstname")! as! String
    let lastName:String = UserDefaults.standard.value(forKey: "lastname")! as! String
}
