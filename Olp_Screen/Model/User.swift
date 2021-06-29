//
//  User.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 27, 2021

import Foundation

struct User : Codable {

        let bio : String?
        let country : String?
        let createdAt : String?
        let deletedAt : String?
        let email : String?
        let fullName : String?
        let id : Int?
        let newsletter : Bool?
        let profilePic : UserProfilePic?
        let status : String?
        let updatedAt : String?
        let userName : String?

        enum CodingKeys: String, CodingKey {
                case bio = "bio"
                case country = "country"
                case createdAt = "created_at"
                case deletedAt = "deleted_at"
                case email = "email"
                case fullName = "full_name"
                case id = "id"
                case newsletter = "newsletter"
                case profilePic = "profile_pic"
                case status = "status"
                case updatedAt = "updated_at"
                case userName = "user_name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                bio = try values.decodeIfPresent(String.self, forKey: .bio)
                country = try values.decodeIfPresent(String.self, forKey: .country)
                createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
                deletedAt = try values.decodeIfPresent(String.self, forKey: .deletedAt)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                newsletter = try values.decodeIfPresent(Bool.self, forKey: .newsletter)
            profilePic = try UserProfilePic(from: decoder)
                status = try values.decodeIfPresent(String.self, forKey: .status)
                updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
                userName = try values.decodeIfPresent(String.self, forKey: .userName)
        }

}
