//
//  Save.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 25/05/21.
//

import Foundation
struct WelcomeElement: Codable {
    let id: Int?
    let videoTitle: String?
    let videoCover: String?
    let categoryID: Int?
    let shortDescription: String?
    let video: String?
    let transcodedVideoURL: String?
    let deepLink: String?
    let jobID: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case videoTitle = "video_title"
        case videoCover = "video_cover"
        case categoryID = "category_id"
        case shortDescription = "short_description"
        case video = "video"
        case transcodedVideoURL = "transcoded_video_url"
        case deepLink = "deep_link"
        case jobID = "job_id"
    }
}
