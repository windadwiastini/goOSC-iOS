//
//  TopUpView.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import AVKit
import Photos
class TopUpView: UIViewController, TopUpViewProtocol,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var presenter: TopUpPresenterProtocol?
    var vSpinner:UIView?
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var evidenceImage: UIImageView!
    
    var dataSource: [Int] = []
    var amountSelected:Double = 0
    enum AttachmentType: String{
        case camera, video, photoLibrary
    }
    fileprivate var currentVC: UIViewController?
//    static let shared = AttachmentHandler()
    var imagePickedBlock: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TopUpWireFrame.createTopUpModule(self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func updateDataAmount(_ resp: TopUp.ResponseAmount) {
        dataSource = resp.data
        print(dataSource)
        collectionView.reloadData()
    }
    
    func viewAlert(data resp: TopUp.ResponseAmount) {
        let alert = UIAlertController(title: "Info", message: resp.message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            self.closeModal()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func load(_ sender: Any) {
        showAttachmentActionSheet(vc: self)
    }
    
    func showAttachmentActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: TopUp.Constants.actionFileTypeHeading, message: TopUp.Constants.actionFileTypeDescription, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: TopUp.Constants.camera, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .camera, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: TopUp.Constants.phoneLibrary, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .photoLibrary, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: TopUp.Constants.cancelBtnTitle, style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            currentVC?.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            currentVC?.present(myPickerController, animated: true, completion: nil)
        }
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagePickedBlock = image
            evidenceImage.image = image
            currentVC?.dismiss(animated: true, completion: nil)
        } else{
            print("Something went wrong in  image")
        }
    }
    
    func authorisationStatus(attachmentTypeEnum: AttachmentType, vc: UIViewController){
        currentVC = vc
        if attachmentTypeEnum ==  AttachmentType.camera{
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status{
            case .authorized: // The user has previously granted access to the camera.
                self.openCamera()
                
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.openCamera()
                    }
                }
                //denied - The user has previously denied access.
            //restricted - The user can't grant access due to restrictions.
            case .denied, .restricted:
                print(attachmentTypeEnum)
//                self.addAlertForSettings(attachmentTypeEnum)
                return
                
            default:
                break
            }
        }else if attachmentTypeEnum == AttachmentType.photoLibrary{
            let status = PHPhotoLibrary.authorizationStatus()
            switch status{
            case .authorized:
                if attachmentTypeEnum == AttachmentType.photoLibrary{
                    photoLibrary()
                }
            case .denied, .restricted:
                print(attachmentTypeEnum)
//                self.addAlertForSettings(attachmentTypeEnum)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == PHAuthorizationStatus.authorized{
                        // photo library access given
                        self.photoLibrary()
                    }
                })
            default:
                break
            }
        }
    }
    
    
    @IBAction func submitTopUp(_ sender: Any) {
        presenter?.interactor?.submitTopup(ammount: amountSelected, file: imagePickedBlock!)
    }
    
    func showSpinner() {
        let spinnerView = UIView.init(frame: view.bounds)
        spinnerView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            self.view.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    
    func applyUserDashboardData(_ user: TopUp.User) {
        nameLabel.text = "\(user.first_name) \(user.last_name)"
        balanceLabel.text = "\(user.user_balance)"
    }
}

extension TopUpView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! TopUpCell
        cell.labelCell.text = String(dataSource[indexPath.row])
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = UIColor(hue: 0.4944, saturation: 1, brightness: 0.88, alpha: 1.0)
            amountSelected = Double(dataSource[indexPath.row])
//            cell.contentView.backgroundColor = UIColor.white
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        } else {
            cell.contentView.backgroundColor = UIColor.white
        }
        return cell
    }
    
}

extension TopUpView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        amountSelected = Double(dataSource[indexPath.row])
    }
}
