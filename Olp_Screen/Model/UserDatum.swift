//
//  UserDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 27, 2021

import Foundation

struct UserDatum : Codable {

        let profilePic : String?
        let user : User?

        enum CodingKeys: String, CodingKey {
                case profilePic = "profile_pic"
                case user = "user"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
            user = try User(from: decoder)
        }

}
