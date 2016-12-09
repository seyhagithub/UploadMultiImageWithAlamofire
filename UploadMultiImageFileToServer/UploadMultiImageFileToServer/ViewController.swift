//
//  ViewController.swift
//  UploadMultiImageFileToServer
//
//  Created by Hiem Seyha on 12/8/16.
//  Copyright © 2016 seyha. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    let pickerController = DKImagePickerController()
    
    var imagePickerView:UIImagePickerController!
    
    var imageDatas: Data!
    
    var imageAsset:[DKAsset]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerView = UIImagePickerController()

    }

    @IBAction func uploadFirstImageButton(_ sender: Any) {
        
       
        imagePickerView.delegate = self
        imagePickerView.sourceType = .photoLibrary
       
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            
            print("=========didSelectAssets============")
            print(assets)
            
            self.imageAsset = assets
            
            for asset in assets {
                
                asset.fetchOriginalImageWithCompleteBlock({ (image, info) in
                    
                    self.firstImageView.image = image
                    
                    print(image)
                    
                })
            }

        }
        
        // present(imagePickerView, animated: true, completion: nil)
         present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadSecondImageButton(_ sender: Any) {
        
        
    }
    
    
    @IBAction func uploadMultipleImageToServer(_ sender: Any) {
        
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("======= Hello ========")
        
    }


}

