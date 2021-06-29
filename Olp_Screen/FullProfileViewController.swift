//
//  FullProfileViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 29/04/21.
//

import UIKit

class FullProfileViewController: UIViewController {

    var tabBar = TabBarViewController()
    var logInData : logInField?
    @IBOutlet var createdAt: UILabel!
    @IBOutlet var fullName: UILabel!
    var userData1 = [userDetails]()
    var profileImage = [profilePhoto]()
    @IBOutlet var email: UILabel!
    @IBOutlet var profilePic: UIImageView!
    var image: UIImage?
    var bio: String?
    override func viewDidLoad() {
        super.viewDidLoad()
     
        profilePic.layer.borderWidth=1.0
       // profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.clipsToBounds = true
        
        print(userData1.count)
        profilePic.image = image
        var userId = [String:Any]()
        userId["user_id"] = UserDefaults.userId
        commenWs.GETURL(url: USERDETAILS_URL, dict: userId) { (response, status) in

            if status{

               if let data = response["data"] as? [String:Any]{

                if let userData = data["user"] as? [String:Any]{

                    do{

                        let jsonData = try JSONSerialization.data(withJSONObject: userData, options: .prettyPrinted)
                        let reqStr = String(data: jsonData, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let data1 = try JSONDecoder().decode(User.self, from: strToData!)

                        let emainId = data1.email
                        let fullName = data1.fullName
                        let date = data1.createdAt

                        let userBio = data1.bio

                        DispatchQueue.main.async {
                            let addData = userDetails(email: emainId!, fullName: fullName!, date: date! ,  bio: userBio ?? "good morning")

                            self.userData1.append(addData)

                            self.funcData(with: self.userData1[0])
                        }




                    }
                    catch{
                        print(error.localizedDescription)
                    }

//                    if let userPic = userData["profile_pic"] as? [String:Any] {
//
//                        do{
//
//                            let jsonData = try JSONSerialization.data(withJSONObject: userPic, options: .prettyPrinted)
//                            let reqStr = String(data: jsonData, encoding: .utf8)
//                            let strToData = reqStr?.data(using: .utf8)
//                            let profileData = try JSONDecoder().decode(UserProfilePic.self, from: strToData!)
//                    print(profileData)
////                            let emainId = data1.email
////                            let fullName = data1.fullName
////                            let date = data1.createdAt
//                            let userProfile = profileData.url
////                            let userBio = data1.bio
//                            let url = URL(string:userProfile!)
//                               if let data = try? Data(contentsOf: url!)
//                               {
//                                let image: UIImage = UIImage(data: data)!
//
//                                let addData = profilePhoto(image: image)
//    //
//                               self.profileImage.append(addData)
//    //
//                                self.profile(with: self.profileImage[0])
//                               }
//
//
//
//
//                        }
//                        catch{
//                            print(error.localizedDescription)
//                        }
//                    }


//                 if let userPic = data["profile_pic"] as? [String: Any] {
//
//                        do{
//                            let jsonData = try JSONSerialization.data(withJSONObject: userPic, options: .prettyPrinted)
//                            let reqStr = String(data: jsonData, encoding: .utf8)
//                            let strToData = reqStr?.data(using: .utf8)
//                            let data1 = try JSONDecoder().decode(UserDatum.self, from: strToData!)
//
//                            let image = data1.profilePic
//                            print(image)
//                       }
//                        catch{
//
//                        }
//
//                    }
               }


                else {
                    print("mismatch")
                }

               }

            }

        }

        

    }
    
    func funcData(with model : userDetails)  {
        
        email.text = model.email
        fullName.text = model.fullName
        createdAt.text = model.date
       
        bio = model.bio
    }
    
    func profile(with model:profilePhoto){
        
        profilePic.image = model.image
    }
    
  

    @IBAction func editName(_ sender: UIButton) {
        
        
        
        let alert = UIAlertController(title: "Change FullName", message: "Enter a Name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = self.fullName.text
            func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
                
                return true
                
            }
        }

        let alertAction = UIAlertAction(title: "OK", style: .default) {  (_) in
            
            let textField = alert.textFields![0]
            var editData = [String:Any]()
            editData["full_name"] = textField.text
            editData["authentication-token"] = UserDefaults.authToken
            if textField.text != ""{
                
                commenWs.PutUrl(url: EDITUSERURL, dict: editData){response,status in
                    if response["status"] as! Int == 200 {
                        self.fullName.text = textField.text
                        let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                          let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            }
                         alert.addAction(alertAction)
                          self.present(alert, animated: true, completion: nil)
                    }

                }
            }
            
            else {
               
                let alert = UIAlertController(title: "Error" , message: "FullName can't empty", preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
          
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
            }
 
        }
        alert.addAction(alertAction)
   
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func changeEmail(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Change Email", message: "Enter a Email", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = self.email.text
            func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
                
                return true
                
            }
        }

        let alertAction = UIAlertAction(title: "OK", style: .default) {  (_) in
            
            let textField = alert.textFields![0]
            
            self.email.text = textField.text
         
        }
        alert.addAction(alertAction)
   
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func editBio(_ sender: UIButton) {
        
    let aVc = storyboard?.instantiateViewController(identifier: "EditBioViewController") as! EditBioViewController
        
        aVc.userName = fullName.text
        aVc.createdAt = createdAt.text
        aVc.newBio = bio
        aVc.image = profilePic.image
        
        navigationController?.pushViewController(aVc, animated: true)
    
    }
    @IBAction func logOut(_ sender: UIButton) {
        
        var logOut = [String:Any]()
        logOut["authentication-token"] = UserDefaults.authToken
        
        commenWs.PostURL(url: LOGOUT_URL, dict: logOut) { (response, status) in
            
            if response["status"] as! Int == 200 {
                
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    let aVc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
                   
                    self.navigationController?.pushViewController(aVc, animated: true)
          
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
                
                
                self.tabBarController?.tabBar.isHidden = true
                
            }
            else {
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
          
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
            }
            
        }
        
       
    }
}

