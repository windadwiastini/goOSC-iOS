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
    weak var presenter: DetailPresenterProtocol?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var viewVount: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    fileprivate let playerViewController = AVPlayerViewController()
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createDetailModule(self, presenter?.product)
        presenter?.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        prepareObserve()
    }
    
    fileprivate func prepareObserve() {
        playBtn.reactive.controlEvents(.touchUpInside).observeNext { e in
            self.present(self.playerViewController, animated: true) {
                self.playerViewController.player!.play()
            }
        }.dispose(in: bag)
        
        addToCartBtn.reactive.controlEvents(.touchUpInside).observeNext { e in
            self.addToCartBtn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(0.40), options: UIViewAnimationOptions.allowUserInteraction, animations: {self.addToCartBtn.transform = CGAffineTransform.identity}, completion: nil)
            self.presenter?.interactor?.insertCartToDB(self.presenter!.product!, UserDefaults.standard.integer(forKey: "userId"))
        }.dispose(in: bag)
        
        likeBtn.reactive.controlEvents(.touchUpInside).observeNext { e in
            self.likeBtn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(0.40), options: UIViewAnimationOptions.allowUserInteraction, animations: {self.likeBtn.transform = CGAffineTransform.identity}, completion: nil)
            self.presenter?.interactor?.likeProduct((self.presenter?.product)!)
        }
        
        backBtn.reactive.controlEvents(.touchUpInside).observeNext { e in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
    
    func showItem(_ data: Detail.ResponseData) {
        titleLabel.text = data.name
        desc.text = data.description
        likeCount.text = String(data.likeCount)
        viewVount.text = String(data.viewCount)
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
        
        let urlAV = URL(string: "\(Config().url)\(data.preview.string)")
        let moviePlayer1 = AVPlayer(url: urlAV!)
        playerViewController.player = moviePlayer1
    }
    
    func updateLike(_ data: Detail.ResponseData) {
        likeCount.text = String(data.likeCount)
    }
}
