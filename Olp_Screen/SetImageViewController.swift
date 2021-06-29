//
//  SetImageViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 28/04/21.
//

import UIKit

class SetImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var img :UIImage!
    @IBOutlet var imageView: UIView!
    var email : String?
    var coreModel = coreDataModel()
    var user : UserData?
    @IBOutlet var addBio: UITextView!
    @IBOutlet var profilePic: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        profilePic.layer.borderWidth=1.0
       // profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.clipsToBounds = true
        //coreModel.editBio(bio: addBio.text)
        
        
        let TapGesture = UITapGestureRecognizer()
        imageView.addGestureRecognizer(TapGesture)
        TapGesture.addTarget(self, action: #selector(pichImage))
        
        // Do any additional setup after loading the view.
    }
    @objc func pichImage() {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
    
        
        self.present(imagePicker, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profilePic.contentMode = .scaleToFill
        //profilePic.image = pickImg
        profilePic.image  = tempImage
        //img = tempImage

       dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
                print("Image not found!")
                return
        }
        profilePic.image = selectedImage
}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
        }

    @IBAction func `continue`(_ sender: UIButton) {

        var profile = [String:Any]()
        img = profilePic.image
        let image : UIImage = profilePic.image!
        let imageData = image.jpegData(compressionQuality: 0.2)
        let base64String = imageData?.base64EncodedString()
        profile["profile_pic"] = base64String!
        profile["authentication-token"] = UserDefaults.authToken
        
        commenWs.PostURL(url: UPLOADPIC_URL, dict: profile) { (response, status) in
            
            if response["status"] as! Int == 200 {
                
                
                      let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.present(alert, animated: true, completion: nil)
                    let aVc = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController

                          
                    self.navigationController?.pushViewController(aVc, animated: true)
                        }
                       alert.addAction(alertAction)
                       
                
            }
            else{
          
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
          
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
              }
            
        }
        
        
        
     //if let png = self.profilePic.image!.pngData(){

          //  var flage : Bool?

       // flage = coreDataModel.instance.setPhoto(user: user!, uPhoto: png)
            
       // if(flage!){
            
                
       // }
        
    }

}

