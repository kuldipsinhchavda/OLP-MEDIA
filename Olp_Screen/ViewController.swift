//
//  ViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 27/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signIn: UIButton!
    @IBOutlet var joinIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.layer.cornerRadius = 5
        signIn.layer.borderWidth = 2
        signIn.layer.borderColor = UIColor.white.cgColor
        
        joinIn.layer.cornerRadius = 5
        joinIn.layer.borderWidth = 2
        joinIn.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    @IBAction func joinIn(_ sender: UIButton) {
        
       let aVc = storyboard?.instantiateViewController(identifier: "SignInViewController")
        as! SignInViewController
        navigationController?.pushViewController(aVc, animated: true)
        
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "JoinViewController")
         as! JoinViewController
         navigationController?.pushViewController(aVc, animated: true)
    }
}

