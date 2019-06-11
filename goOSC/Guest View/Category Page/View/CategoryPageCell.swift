//
//  CategoryPageCell.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class CategoryPageCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configureCell(title: String, type: String) {
        if type == "category" {
//            categoryLabel.highlightedTextColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            categoryLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            categoryLabel.text = title
        } else {
            categoryLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            categoryLabel.text = "  \(title)"
        }
    }
}
