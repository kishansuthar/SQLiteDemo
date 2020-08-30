//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Kishan Suthar on 29/08/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import UIKit

class Student
{
    
    var id: Int = 0
    var name: String = ""
    var age: Int = 0
    var college: String = ""
    var cgpa : Double = 0.0
    var image : String = ""
    
    init(id:Int, name:String, age:Int,college: String,cgpa : Double,image: String)
    {
        self.id = id
        self.name = name
        self.age = age
        self.college = college
        self.cgpa = cgpa
        self.image = image
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var cgpa: UITextField!
    @IBOutlet weak var college: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var db:DBHelper = DBHelper()
    
    var students:[Student] = []
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnAddDataAction(_ sender: UIButton) {
        
        let imageData = imgProfile.image!.pngData()
        
        let strBase64  = (imageData?.base64EncodedString(options: .lineLength64Characters))!
        
        let agge = Int(age.text ?? "0") ?? 0
        
        let cgps = Double(cgpa.text ?? "0.0") ?? 0.0
        db.insert(id: 0, name: name.text ?? "", age: agge, college: college.text ?? "", cgpa: cgps, image: strBase64)
        
        self.performSegue(withIdentifier: "segueAddToList", sender: self)
        
    }
    
    
    @IBAction func btnSelectImage(_ sender: Any) {
        openGallary()
        
    }
    
    func openGallary() {
        DispatchQueue.main.async {
            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let cameraAction: UIAlertAction = UIAlertAction(title: "Take a New Photo", style: .default) { action -> Void in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    
                    self.picker.delegate = self
                    self.picker.sourceType = .camera;
                    self.picker.allowsEditing = false
                    self.present(self.picker, animated: true, completion: nil)
                }else {
                }
            }
            
            let libraryAction: UIAlertAction = UIAlertAction(title: "Choose from Camera Roll", style: .default) { action -> Void in
                
                if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                    
                    self.picker.delegate = self
                    self.picker.sourceType = .photoLibrary;
                    self.picker.allowsEditing = false
                    self.present(self.picker, animated: true, completion: nil)
                }
            }
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            }
            
            actionSheetController.addAction(cameraAction)
            actionSheetController.addAction(libraryAction)
            actionSheetController.addAction(cancelAction)
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
    
    // MARK:- no camera found method call
    func noCamera(Title:String,Message:String){
        let alertVC = UIAlertController(title:Title,message: Message,preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style:.default,handler: nil)
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
    }
    
    @IBAction func btnGoA(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "segueAddToList", sender: self)
    }
    
}


extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imgProfile.image = image
        //self.isImageChange = true
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
