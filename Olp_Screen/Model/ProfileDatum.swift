//
//  ProfileDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 26, 2021

import Foundation

struct ProfileDatum : Codable {

        let profilePic : String?

        enum CodingKeys: String, CodingKey {
                case profilePic = "profile pic"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        }

}
