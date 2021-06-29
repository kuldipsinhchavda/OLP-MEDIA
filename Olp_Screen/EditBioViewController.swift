//
//  EditBioViewController.swift
//  Olp_Screen
//  Created by Bharat Kakadiya on 29/04/21.

import UIKit
import CoreData

class EditBioViewController: UIViewController, UITextViewDelegate {
 
    @IBOutlet var fullName: UILabel!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var date: UILabel!
    @IBOutlet var setting: UIButton!
    @IBOutlet var editBioTextField: UITextView!
    var newBio : String?
    var image: UIImage?
    var userName: String?
    var createdAt : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //editBioTextField.delegate = self
       // SetBackBarButtonCustom()
        setting.layer.cornerRadius = 5
        setting.layer.borderWidth = 2
        setting.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.borderWidth=1.0
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.clipsToBounds = true
        fullName.text = userName
        date.text = createdAt
        editBioTextField.text = newBio
        profilePic.image = image
    }
    func SetBackBarButtonCustom()
    {
        //Back buttion
        let btnLeftMenu = UIButton(type: UIButton.ButtonType.custom)
        btnLeftMenu.setImage(UIImage(systemName: "chevron.backward"), for: UIControl.State.normal)
        btnLeftMenu.addTarget(self, action: #selector(ForgetPasswordViewController.onClcikBack), for: UIControl.Event.touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItems = [barButton]
    }

    @objc func onClcikBack()
    {
        let aVc = storyboard?.instantiateViewController(identifier: "FullProfileViewController") as! FullProfileViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
    @IBAction func setting(_ sender: UIButton) {
        let aVc = storyboard?.instantiateViewController(identifier: "FullProfileViewController") as! FullProfileViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
        
    @IBAction func saveBio(_ sender: UIButton) {

        var editData = [String:Any]()
        editData["bio"] = editBioTextField.text
        editData["authentication-token"] = UserDefaults.authToken
        
        if editBioTextField.text != "" {
            
            commenWs.PutUrl(url: EDITUSERURL, dict: editData){ response,status in
                
                if response["status"] as! Int == 200 {
                    
                    let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                      let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        let aVc = self.storyboard?.instantiateViewController(identifier: "FullProfileViewController") as! FullProfileViewController
                        self.navigationController?.pushViewController(aVc, animated: true)
              
                      }
                     alert.addAction(alertAction)
                      self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
   

