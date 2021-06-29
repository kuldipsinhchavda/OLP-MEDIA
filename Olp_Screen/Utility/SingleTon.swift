//
//  SingleHud.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 20/05/21.
//

import Foundation
import Reachability
import MBProgressHUD
import Alamofire

class SingleTon: NSObject {
    
    static let shareSingleTon = SingleTon()
    
   class func isInternetAvailable() -> Bool {
       var status:Bool
       let rechability = try! Reachability()
       switch rechability.connection {
       case .none:
           debugPrint("Not Connected")
           status = false
       case .wifi:
           debugPrint("Available")
           status = true
       case .cellular:
           debugPrint("Available")
           status = true
       case .unavailable:
           debugPrint("Not Connected")
           status = false
       }
       return status
   }
    
    class func showHud(vc: HomeViewController){
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: vc.view, animated: true)
        }
    }
    
    class func hideHud(vc: HomeViewController) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: vc.view, animated: true)
        }
        
    }
//    class func writeString(data: String, key: String)  {
//        UserDefaults.standard.set(data, forKey: key)
//        UserDefaults.standard.synchronize()
//    }
}
