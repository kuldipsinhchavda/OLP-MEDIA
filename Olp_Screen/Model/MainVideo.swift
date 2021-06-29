//
//  MainVideo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 25, 2021

import Foundation

struct MainVideo : Codable {

        let createdAt : String?
        let id : Int?
        let videoCover : String?
        let videoSeries : String?
        let videoTitle : String?

        enum CodingKeys: String, CodingKey {
                case createdAt = "created_at"
                case id = "id"
                case videoCover = "video_cover"
                case videoSeries = "video_series"
                case videoTitle = "video_title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                videoCover = try values.decodeIfPresent(String.self, forKey: .videoCover)
                videoSeries = try values.decodeIfPresent(String.self, forKey: .videoSeries)
                videoTitle = try values.decodeIfPresent(String.self, forKey: .videoTitle)
        }

}
