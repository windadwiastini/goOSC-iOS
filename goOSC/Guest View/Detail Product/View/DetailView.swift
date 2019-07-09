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
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    let playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createDetailModule(self, presenter?.product)
        presenter?.viewDidLoad()
    }
    
    func showItem(_ data: Detail.ResponseData) {
        titleLabel.text = data.name
        desc.text = data.description
        likeCount.text = String(data.like_count)
        viewVount.text = String(data.view_count)
        categoryLabel.text = data.category
        let priceInt = Int(data.price)
        priceLabel.text = "\((priceInt).formattedWithSeparator)"
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
    }
    
    func updateLike(_ data: Detail.ResponseData) {
        print("update like")
        likeCount.text = String(data.like_count)
    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func likeBtnWasPressed(_ sender: UIButton) {
        
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(0.40), options: UIViewAnimationOptions.allowUserInteraction, animations: {sender.transform = CGAffineTransform.identity}, completion: nil)
        presenter?.interactor?.likeProduct((presenter?.product)!)
    }
    
    @IBAction func showPreview(_ sender: Any) {
        self.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(0.40), options: UIViewAnimationOptions.allowUserInteraction, animations: {sender.transform = CGAffineTransform.identity}, completion: nil)
        presenter?.interactor?.insertCartToDB(presenter!.product!, UserDefaults.standard.integer(forKey: "userId"))
    }
    
}
