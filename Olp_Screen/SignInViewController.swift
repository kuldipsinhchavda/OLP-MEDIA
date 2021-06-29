//
//  SignInViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 27/04/21.
//

import UIKit
import CoreData
import GoogleSignIn

class SignInViewController: UIViewController {

    var sign = [SignUser]()
    var signInData = [signInField]()
    @IBOutlet var SignIn: UIButton!
    @IBOutlet var fName: UITextField!
    @IBOutlet var uName: UITextField!
    @IBOutlet var country: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        SignIn.layer.cornerRadius = 5
        SignIn.layer.borderWidth = 2
        SignIn.layer.borderColor = UIColor.black.cgColor
       
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    @IBAction func checkIn(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5,delay: 0.1,options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            sender.isSelected = !sender.isSelected
            
        }){(success) in
            
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {sender.transform = .identity}, completion: nil)
        }
        
    }
 
    @IBAction func signIn(_ sender: UIButton) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "JoinViewController")
         as! JoinViewController
         navigationController?.pushViewController(aVc, animated: true)
    }
    
    @IBAction func joinIn(_ sender: UIButton) {
        var signIn = [String:Any]()
        signIn["email"] = email.text
        signIn["password"] = password.text
        signIn["full_name"] = fName.text
        signIn["user_name"] = uName.text
        signIn["country"] = country.text
        
        commenWs.PostURL(url: SIGNIN_URL, dict: signIn) { (response, status) in
            
            if response["status"] as! Int == 200 {
                if let UsersignIn = response["data"] as? [String:Any]{
                    do{
                        let jsonData = try JSONSerialization.data(withJSONObject: UsersignIn, options: .prettyPrinted)
                        let reqStr = String(data: jsonData, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let userData = try JSONDecoder().decode(SignDatum.self, from: strToData!)
                        UserDefaults.authToken = (userData.token?.authToken)!
                        let signInArray = userData.user
                        let dataArray = signInField(id: signInArray?.id ?? 0, email: signInArray?.email! ?? "", fullName: signInArray?.fullName ?? "", userName: signInArray?.userName ?? "", country: signInArray?.country ?? "", profilePic: signInArray?.profilePic ?? "", newsletter: signInArray?.newsletter ?? "", resetPasswordToken: signInArray?.resetPasswordToken ?? "", resetPasswordSentAt: signInArray?.rememberCreatedAt ?? "", rememberCreatedAt: signInArray?.rememberCreatedAt ?? "", createdAt: signInArray?.createdAt ?? "", updatedAt: signInArray?.updatedAt ?? "", status: signInArray?.status ?? "", bio: signInArray?.bio ?? "")
                        self.signInData.append(dataArray)
                        print("<<<<<<<<<<<<<<<<<\(dataArray)")
                    }
                    catch{}
                
            }
        }
            else
            {
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
                   
                }
                alert.addAction(saveAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    @IBAction func loginWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}
