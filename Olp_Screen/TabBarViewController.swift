//
//  TabBarViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 05/05/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.image = UIImage(named: "2")
        self.tabBarItem.selectedImage = UIImage(named: "3")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}
