//
//  MainCategoriesDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 25, 2021

import Foundation

struct MainCategoriesDatum : Codable {

        let descriptionField : String?
        let externalUrl : String?
        let id : Int?
        let image : String?
        let longDescription : String?
        let name : String?
        let shortDescription : String?
        let topicName : String?
        let type : String?
        let videoSeries : String?
        let videos : [VideoModel]?
        let videosCount : Int?

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case externalUrl = "external_url"
                case id = "id"
                case image = "image"
                case longDescription = "long_description"
                case name = "name"
                case shortDescription = "short_description"
                case topicName = "topic_name"
                case type = "type"
                case videoSeries = "video_series"
                case videos = "videos"
                case videosCount = "videos_count"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                externalUrl = try values.decodeIfPresent(String.self, forKey: .externalUrl)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                image = try values.decodeIfPresent(String.self, forKey: .image)
                longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
                topicName = try values.decodeIfPresent(String.self, forKey: .topicName)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                videoSeries = try values.decodeIfPresent(String.self, forKey: .videoSeries)
                videos = try values.decodeIfPresent([VideoModel].self, forKey: .videos)
                videosCount = try values.decodeIfPresent(Int.self, forKey: .videosCount)
        }

}
struct VideoModel : Codable {

        let categoryId : Int?
        let deepLink : String?
        let id : Int?
        let jobId : String?
        let shortDescription : String?
        let transcodedVideoUrl : String?
        let video : String?
        let videoCover : String?
        let videoTitle : String?

        enum CodingKeys: String, CodingKey {
                case categoryId = "category_id"
                case deepLink = "deep_link"
                case id = "id"
                case jobId = "job_id"
                case shortDescription = "short_description"
                case transcodedVideoUrl = "transcoded_video_url"
                case video = "video"
                case videoCover = "video_cover"
                case videoTitle = "video_title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
                deepLink = try values.decodeIfPresent(String.self, forKey: .deepLink)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                jobId = try values.decodeIfPresent(String.self, forKey: .jobId)
                shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
                transcodedVideoUrl = try values.decodeIfPresent(String.self, forKey: .transcodedVideoUrl)
                video = try values.decodeIfPresent(String.self, forKey: .video)
                videoCover = try values.decodeIfPresent(String.self, forKey: .videoCover)
                videoTitle = try values.decodeIfPresent(String.self, forKey: .videoTitle)
        }

}
