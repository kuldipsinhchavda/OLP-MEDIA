//
//  LoginDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 20, 2021

import Foundation

struct LoginDatum : Codable {

        let token : LoginToken?
        let user : LoginUser?

        enum CodingKeys: String, CodingKey {
                case token = "token"
                case user = "user"
        }
    
       
}
