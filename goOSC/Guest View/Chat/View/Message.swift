//
//  Message.swift
//  goOSC
//
//  Created by Bootcamp on 22/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

//import Foundation
import UIKit

class Message: BaseCell {
    var message: Chat.Detail? {
        didSet {
            messageLabel.text = message?.message
            setupContainerView(msg: message!.message, email: message!.useremail)
        }
    }
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    override func setupViews() {
    }
    
    private func setupContainerView(msg dataMsg: String, email emailData: String) {
        let containerView = UIView()
        containerView.layer.cornerRadius = 5
        addSubview(containerView)
        print("===========")
        print(dataMsg)
        print(emailData)
        print("===========")
        let size = CGSize(width: 375, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: dataMsg).boundingRect(with: size, options: option, attributes:[NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)], context: nil)
        let wdh = estimatedFrame.width + 10
        if emailData == Auth().email {
            containerView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            addConstraintsWithFormat(format: "H:|[v0(\(wdh))]|", views: containerView)
        } else {
            addConstraintsWithFormat(format: "H:|-\(375 - wdh)-[v0(\(wdh))]|", views: containerView)
            containerView.backgroundColor = UIColor(red: 0.5098, green: 0.851, blue: 0.9294, alpha: 1.0)
            
        }
        addConstraintsWithFormat(format: "V:|-5-[v0(\(estimatedFrame.height + 10))]|", views: containerView)
        containerView.addSubview(messageLabel)
        containerView.addConstraintsWithFormat(format: "H:|-10-[v0]|", views: messageLabel)
        containerView.addConstraintsWithFormat(format: "V:|-5-[v0]|", views: messageLabel)
    }
    
}

extension UIView {

    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}
