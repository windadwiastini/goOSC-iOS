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
    
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var viewVount: UILabel!
    let playerViewController = AVPlayerViewController()
    var prod:Detail.ResponseData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createDetailModule(self, presenter?.product)
        presenter?.viewDidLoad()
    }
    
    func showItem(_ data: Detail.ResponseData) {
        prod = data
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
        print("\(Config().url)\(data.preview.String)")
        let moviePlayer1 = AVPlayer(url: urlAV!)
        playerViewController.player = moviePlayer1
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
        
        likeCount.text = String(data.like_count)
        viewVount.text = String(data.view_count)
    }
    
    @IBAction func goBackToHomePage(_ sender: Any) {
        presenter?.wireFrame?.routeToHomePage(from: self)
    }
    
    
    @IBAction func showPreview(_ sender: Any) {
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        if prod != nil {
            print(prod)
            print(UserDefaults.standard.string(forKey: "userId"))
//            presenter?.interactor?.insertCartToDB(prod!, UserDefaults.standard.string(forKey: "userId")!)
        }
    }
    
}
