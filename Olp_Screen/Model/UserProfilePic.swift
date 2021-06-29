//
//  UserProfilePic.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 27, 2021

import Foundation

struct UserProfilePic : Codable {

        let thumb : UserThumb?
        let url : String?
        let videoThumb : UserVideoThumb?

        enum CodingKeys: String, CodingKey {
                case thumb = "thumb"
                case url = "url"
                case videoThumb = "video_thumb"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
            thumb = try UserThumb(from: decoder)
                url = try values.decodeIfPresent(String.self, forKey: .url)
            videoThumb = try UserVideoThumb(from: decoder)
        }

}
