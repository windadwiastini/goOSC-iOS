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
        print("Alert class")
        let alert = UIAlertController(title: titleData, message: content, preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "informationAlert"
        alert.view.accessibilityValue = "informationAlert"
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        ref.present(alert, animated: true)
    }
    
    func alertWithClosure(title titleData: String, message content: String, ui ref: UIViewController) {
        let alert = UIAlertController(title: titleData, message: content, preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "closureAlert"
        alert.view.accessibilityValue = "closureAlert"
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
                ref.dismiss(animated: true, completion: nil)
        }))
        ref.present(alert, animated: true)
    }
}
