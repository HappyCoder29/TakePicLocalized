//
//  ViewController.swift
//  TakePicLocalized
//
//  Created by Ashish Ashish on 11/19/20.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnTakePic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTakePic.setTitle(strTakePic, for: .normal)
        
    }

    @IBAction func takePic_Action(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a Pic", message: "", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            if( UIImagePickerController.isSourceTypeAvailable(.photoLibrary) ){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("cancel")

        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)

        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage ] as? UIImage{
            imgView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}

