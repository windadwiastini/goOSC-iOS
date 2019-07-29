//
//  TGAvatarButton.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class TGAvatarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "TGUserInfo")!, for: .normal)
        regularLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.verticalSizeClass == .compact {
            compactLayout()
        } else {
            regularLayout()
        }
    }
    
    private func regularLayout() {
        frame = CGRect(x: 0, y: 0, width: 37, height: 37)
    }
    
    private func compactLayout() {
        frame = CGRect(x: 0, y: 0, width: 28, height: 28)
    }
    
}
