//
//  Alert.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class Alert {
    func informationAlert(title titleData: String, message content: String, ui ref: UIViewController){
        let alert = UIAlertController(title: titleData, message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        ref.present(alert, animated: true)
    }
}
