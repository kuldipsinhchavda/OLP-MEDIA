//
//  JoinViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 27/04/21.
//

import UIKit
import GoogleSignIn

class JoinViewController: UIViewController {
 
    var logInData = [logInField]()
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.layer.cornerRadius = 5
        signIn.layer.borderWidth = 2
        signIn.layer.borderColor = UIColor.black.cgColor
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
     
      }
    
        // Do any additional setup after loading the view.
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    

    
    @IBAction func join(_ sender: UIButton) {
        let aVc = storyboard?.instantiateViewController(identifier: "SignInViewController")
         as! SignInViewController
         navigationController?.pushViewController(aVc, animated: true)
    }
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        let aVc = storyboard?.instantiateViewController(identifier: "ForgetPasswordViewController")
         as! ForgetPasswordViewController
         navigationController?.pushViewController(aVc, animated: true)
        
    }
    
  
    
    @IBAction func login(_ sender: UIButton) {
        
        var loginDict = [String:Any]()
        loginDict["email"] = email.text
        loginDict["password"] = password.text
        
        
        commenWs.PostURL(url:LOGIN_URL, dict: loginDict) { (responce, status) in
            
            
            if let loginData = responce["data"] as? [String:Any]{
                
                    do{
                    let jsonData = try JSONSerialization.data(withJSONObject: loginData, options: .prettyPrinted)
                    let reqJSONStr = String(data: jsonData, encoding: .utf8)
                    let data = reqJSONStr?.data(using: .utf8)
                    let user = try JSONDecoder().decode(LoginDatum.self, from: data!)
    
                        if responce["status"] as! Int == 200 {
                            
                            UserDefaults.authToken = (user.token?.authToken)!
                            UserDefaults.userId = user.token?.userId
                      
                            let aVc = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
                             self.navigationController?.pushViewController(aVc, animated: true)
                            
                        }
                        else{
                      
                            let alert = UIAlertController(title: responce["type"] as? String, message: responce["message"] as? String, preferredStyle: .alert)
                              let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                      
                              }
                             alert.addAction(alertAction)
                              self.present(alert, animated: true, completion: nil)
                          }
                        
                    }
                    catch
                    {
                        
                        print(error)
                    }
     
            }
            else
            {
                if let message = responce["message"] as? String, message.count > 0
                {
                    print(message)
                }
            }
   
        }
    }
    @IBAction func loginWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

}
