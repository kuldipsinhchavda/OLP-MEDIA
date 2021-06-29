//
//  UserVideoThumb.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 27, 2021

import Foundation

struct UserVideoThumb : Codable {

        let url : String?

        enum CodingKeys: String, CodingKey {
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
