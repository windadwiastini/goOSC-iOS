//
//  HomePageCell.swift
//  goOSC
//
//  Created by Bootcamp on 6/3/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire

class HomePageCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var addToChart: UIButton!
    func configureCell(data: HomePage.Product) {
        let url = Config().url + data.thumbnail
        Alamofire.request(url).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    self.posterImageView.image = UIImage(data: data)
                }
            }
        }
        nameLabel.text = data.name
        priceLabel.text = "\((data.price).formattedWithSeparator)"
    }
    
}
