//
//  SignDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 21, 2021

import Foundation

struct SignDatum : Codable {

        let token : SignToken?
        let user : SignUser?

        enum CodingKeys: String, CodingKey {
                case token = "token"
                case user = "user"
        }
    
        init(from decoder: Decoder) throws {
            _ = try decoder.container(keyedBy: CodingKeys.self)
            token = try SignToken(from: decoder)
            user = try SignUser(from: decoder)
        }

}
struct SignIn : Codable {

        let data : SignDatum?
        let message : String?
        let status : Int?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case message = "message"
                case status = "status"
                case type = "type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try SignDatum(from: decoder)
                message = try values.decodeIfPresent(String.self, forKey: .message)
                status = try values.decodeIfPresent(Int.self, forKey: .status)
                type = try values.decodeIfPresent(String.self, forKey: .type)
        }

}

struct SignToken : Codable {

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
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
                createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
                deviceToken = try values.decodeIfPresent(String.self, forKey: .deviceToken)
                deviceType = try values.decodeIfPresent(String.self, forKey: .deviceType)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
                userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        }

}

struct SignUser : Codable {

        let bio : String?
        let country : String?
        let createdAt : String?
        let email : String?
        let fullName : String?
        let id : Int?
        let newsletter : String?
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
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                bio = try values.decodeIfPresent(String.self, forKey: .bio)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                newsletter = try values.decodeIfPresent(String.self, forKey: .newsletter)
                profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
                rememberCreatedAt = try values.decodeIfPresent(String.self, forKey: .rememberCreatedAt)
                resetPasswordSentAt = try values.decodeIfPresent(String.self, forKey: .resetPasswordSentAt)
                resetPasswordToken = try values.decodeIfPresent(String.self, forKey: .resetPasswordToken)
                status = try values.decodeIfPresent(String.self, forKey: .status)
                updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
                userName = try values.decodeIfPresent(String.self, forKey: .userName)
        }

}
