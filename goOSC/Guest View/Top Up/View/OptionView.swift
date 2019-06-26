//
//  OptionView.swift
//  goOSC
//
//  Created by Bootcamp on 26/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class OptionView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goBackToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
