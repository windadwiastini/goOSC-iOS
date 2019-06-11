//
//  DetailView.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailView: UIViewController, DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var videoSpace: UIView!
    
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var viewVount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createDetailModule(self, presenter?.product)
        presenter?.viewDidLoad()
    }
    
    func showItem(_ data: Detail.ResponseData) {
        titleLabel.text = data.name
        let url = URL(string: "\(Config().url)\(data.thumbnail)")
        do {
            let dataImage = try Data(contentsOf: url!)
            imageDetail.image = UIImage(data: dataImage)
        } catch let error {
            print("error: \(error)")
        }
        
        desc.text = data.description
        let urlAV = URL(string: "\(Config().url)\(data.preview.String)")
        let moviePlayer1 = AVPlayer(url: urlAV!)
        let moviePlayer = AVPlayerLayer(player: moviePlayer1)
        moviePlayer.frame = videoSpace.bounds
        videoSpace.layer.addSublayer(moviePlayer)
        moviePlayer1.play()
        
        likeCount.text = String(data.like_count)
        viewVount.text = String(data.view_count)
    }
    
    @IBAction func goBackToHomePage(_ sender: Any) {
        presenter?.wireFrame?.routeToHomePage(from: self)
    }
    
}
