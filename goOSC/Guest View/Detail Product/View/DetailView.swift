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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createDetailModule(self, presenter?.product)
        presenter?.viewDidLoad()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showItem(_ data: Detail.ResponseData) {
        titleLabel.text = data.name
        desc.text = data.description
        likeCount.text = String(data.like_count)
        viewVount.text = String(data.view_count)
        let url = URL(string: "\(Config().url)\(data.thumbnail)")
        do {
            let dataImage = try Data(contentsOf: url!)
            imageDetail.image = UIImage(data: dataImage)
        } catch let error {
            print("error: \(error)")
        }
        
        let urlAV = URL(string: "\(Config().url)\(data.preview.String)")
        let moviePlayer1 = AVPlayer(url: urlAV!)
        playerViewController.player = moviePlayer1
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
    @IBAction func showPreview(_ sender: Any) {
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        print(UserDefaults.standard.value(forKey: "userId"))
        
        presenter?.interactor?.insertCartToDB(presenter!.product!, UserDefaults.standard.integer(forKey: "userId"))
    }
    
}
