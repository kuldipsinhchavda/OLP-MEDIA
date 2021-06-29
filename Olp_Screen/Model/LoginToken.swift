//
//  LoginToken.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 20, 2021

import Foundation

struct LoginToken : Codable {

        let authToken : String?
        let createdAt : String?
        let deviceToken : String?
        let deviceType : String?
        let id : Int?
        let updatedAt : String?
        let userId : Int?

        enum CodingKeys: String, CodingKey {
                case authToken = "auth_token"
                case createdAt = "created_at"
                case deviceToken = "device_token"
                case deviceType = "device_type"
                case id = "id"
                case updatedAt = "updated_at"
                case userId = "user_id"
        }
    
       
}
