//
//  MainDatum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 25, 2021

import Foundation

struct MainDatum : Codable {

        let categoriesData : [MainCategoriesDatum]?
        let currentPage : Int?
        let lastPage : Bool?
        let notificationCount : Int?
        let totalCount : Int?
        let totalPages : Int?

        enum CodingKeys: String, CodingKey {
                case categoriesData = "categories_data"
                case currentPage = "current_page"
                case lastPage = "last_page"
                case notificationCount = "notification_count"
                case totalCount = "total_count"
                case totalPages = "total_pages"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                categoriesData = try values.decodeIfPresent([MainCategoriesDatum].self, forKey: .categoriesData)
                currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
                lastPage = try values.decodeIfPresent(Bool.self, forKey: .lastPage)
                notificationCount = try values.decodeIfPresent(Int.self, forKey: .notificationCount)
                totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
                totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        }

}
