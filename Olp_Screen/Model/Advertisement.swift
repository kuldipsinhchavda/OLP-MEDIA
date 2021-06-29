//
//  Advertisement.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 26/05/21.
//

import Foundation
struct AdvertiseCoder : Codable {

        let descriptionField : String?
        let externalUrl : String?
        let id : Int?
        let image : String?
        let longDescription : String?
        let shortDescription : String?
        let topicName : String?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case externalUrl = "external_url"
                case id = "id"
                case image = "image"
                case longDescription = "long_description"
                case shortDescription = "short_description"
                case topicName = "topic_name"
                case type = "type"
        }
}
