//
//  TopUpCell.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class TopUpCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.contentView.backgroundColor = UIColor(hue: 0.4944, saturation: 1, brightness: 0.88, alpha: 1.0)
            } else {
                self.contentView.backgroundColor = UIColor.white
            }
        }
    }
}
