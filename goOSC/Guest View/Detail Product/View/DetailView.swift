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
    
    func showItem(_ data: Detail.ResponseData) {
        print("show")
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
    
    func updateLike(_ data: Detail.ResponseData) {
        print("update like")
        likeCount.text = String(data.like_count)
    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func likeBtnWasPressed(_ sender: Any) {
        presenter?.interactor?.likeProduct((presenter?.product)!)
    }
    
    @IBAction func showPreview(_ sender: Any) {
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
}
