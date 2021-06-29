//
//  LoginUser.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 20, 2021

import Foundation

struct LoginUser : Codable {

        let bio : String?
        let country : String?
        let createdAt : String?
        let email : String?
        let fullName : String?
        let id : Int?
        let newsletter : Bool?
        let profilePic : String?
        let rememberCreatedAt : String?
        let resetPasswordSentAt : String?
        let resetPasswordToken : String?
        let status : String?
        let updatedAt : String?
        let userName : String?

        enum CodingKeys: String, CodingKey {
                case bio = "bio"
                case country = "country"
                case createdAt = "created_at"
                case email = "email"
                case fullName = "full_name"
                case id = "id"
                case newsletter = "newsletter"
                case profilePic = "profile_pic"
                case rememberCreatedAt = "remember_created_at"
                case resetPasswordSentAt = "reset_password_sent_at"
                case resetPasswordToken = "reset_password_token"
                case status = "status"
                case updatedAt = "updated_at"
                case userName = "user_name"
        }
    
  

}
