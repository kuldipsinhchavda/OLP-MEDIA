//
//  ForgetPasswordViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 27/04/21.
//

import UIKit
import GoogleSignIn
class ForgetPasswordViewController: UIViewController {

    @IBOutlet var login: UIButton!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //SetBackBarButtonCustom()
        login.layer.cornerRadius = 5
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
  
          GIDSignIn.sharedInstance()?.restorePreviousSignIn()
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
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func  viewWillAppear(_ animated: Bool) {
       
        GIDSignIn.sharedInstance().delegate = self

    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
      GIDSignIn.sharedInstance().signOut()
    }
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        
        
        var forgetEmail = [String:Any]()
        forgetEmail["email"] = email.text
        
        commenWs.PostURL(url: FORGET_URL, dict: forgetEmail) { (response, status) in
            
            if  response["status"] as! Int != 200{
                
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
          
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
                
               // print("<<<<<<<<<<<<<<<<<\(forgetData)")
            }
            else{
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                  let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.email.text = ""
                    let aVc = self.storyboard?.instantiateViewController(identifier: "JoinViewController")
                     as! JoinViewController
                    self.navigationController?.pushViewController(aVc, animated: true)
                  }
                 alert.addAction(alertAction)
                  self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func returnLogin(_ sender: UIButton) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "JoinViewController")
         as! JoinViewController
         navigationController?.pushViewController(aVc, animated: true)
        
        
    }
    @IBAction func btnSignInClick(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}
extension ForgetPasswordViewController:GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil{
            print("Gmail login success")
           
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    }
}
