//
//  CommenWs.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 20/05/21.
//

import Foundation
import Alamofire
import MBProgressHUD

class commenWs: NSObject {
    
    
    class func PostURL(url: String, dict:Dictionary<String, Any>, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            let fullUrl = MAIN_URL + url
            print("POST API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            
           // let header : HTTPHeaders = ["authentication-token":"0bdb14907edbcd6de0e0513a8a4b57d9"]
            let header : HTTPHeaders = ["authentication-token":UserDefaults.authToken]

            AF.request(fullUrl, method: .post, parameters: dict, encoding: JSONEncoding.prettyPrinted,headers: header).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print("\n\nPOST API: \(fullUrl)")
                        print(response.value as! NSDictionary)
                        print("\n\n")

                        let data = response.value! as Any as! [String:Any]
                        if (data["status"] ) as! Int == 200
                        {
                            completion(data,true)
                        }
                        else
                        {
                            completion(data,false)
                        }
                    }
                    break
                case .failure(_):
                    print("\n\nPOST API: \(fullUrl)")
                    print(response.error!)
                    print("\n\n")

                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? "", forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false)
                }
            }
        }
        else
        {
            print("INTERNET_ERROR")
        }
    }
    
    
    class func getURL(url:String,completion : @escaping (_ responseData: Dictionary<String,Any> , _ success : Bool) -> () ){
        
        if SingleTon.isInternetAvailable(){
            let header : HTTPHeaders = ["authentication-token":UserDefaults.authToken]
            
            let FULL_URL = MAIN_URL + url
            
            AF.request(FULL_URL, method: .get, encoding: JSONEncoding.prettyPrinted, headers: header).responseJSON{ (response) in
                switch response.result {
                
                case .success(_):
                    if response.value != nil {
                        let data = response.value as! [String:Any]
                        
                        if data["status"] as! Int == 200 {
                            
                            completion(data,true)
                            
                        }
                        else
                        {
                            completion(data,false)
                        }
                        
                    }
                    break
                case .failure(_):
                    print(response.error as Any)
                    
                    let temp = NSDictionary(object: response.error?.localizedDescription ?? "", forKey:"message" as NSCopying)
                    
                    completion(temp as! Dictionary<String, Any>, false)
                }
            }
        }
    }
    
    class func GETURL(url:String,dict:Dictionary<String, Any> ,completion : @escaping (_ responseData: Dictionary<String,Any> , _ success : Bool) -> () ){
        
        if SingleTon.isInternetAvailable(){
            let header : HTTPHeaders = ["authentication-token":UserDefaults.authToken]
        
            let FULL_URL = MAIN_URL + url
            
            AF.request(FULL_URL, method: .get,parameters: dict ,encoding: URLEncoding.default, headers: header).responseJSON{ (response) in
                switch response.result {
                
                case .success(_):
                    if response.value != nil {
                        let data = response.value as! [String:Any]
                        
                        if data["status"] as! Int == 200 {
                            
                            completion(data,true)
                            
                        }
                        else
                        {
                            completion(data,false)
                        }
                        
                    }
                    break
                case .failure(_):
                    print(response.error as Any)
                    
                    let temp = NSDictionary(object: response.error?.localizedDescription ?? "", forKey:"message" as NSCopying)
                    
                    completion(temp as! Dictionary<String, Any>, false)
                }
            }
            
        }
    }
    class func PutUrl(url: String, dict:Dictionary<String, Any>, completion: @escaping (_ responceData:Dictionary<String, Any>, _ success: Bool) -> ())
    {
        if SingleTon.isInternetAvailable()
        {
            let fullUrl = MAIN_URL + url
            print("POST API: \(fullUrl)")
            print("PARAMETER: \(dict as NSDictionary)")
            
           // let header : HTTPHeaders = ["authentication-token":"0bdb14907edbcd6de0e0513a8a4b57d9"]
            let header : HTTPHeaders = ["authentication-token":UserDefaults.authToken]

            AF.request(fullUrl, method: .put, parameters: dict, encoding: JSONEncoding.prettyPrinted,headers: header).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    if response.value != nil
                    {
                        print("\n\nPOST API: \(fullUrl)")
                        print(response.value as! NSDictionary)
                        print("\n\n")

                        let data = response.value! as Any as! [String:Any]
                        if (data["status"] ) as! Int == 200
                        {
                            completion(data,true)
                        }
                        else
                        {
                            completion(data,false)
                        }
                    }
                    break
                case .failure(_):
                    print("\n\nPOST API: \(fullUrl)")
                    print(response.error!)
                    print("\n\n")

                    let temp=NSDictionary.init(object: response.error?.localizedDescription ?? "", forKey: "message" as NSCopying)
                    completion(temp as! Dictionary<String, Any>,false)
                }
            }
        }
        else
        {
            print("INTERNET_ERROR")
        }
    }

}


