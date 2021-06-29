//
//  MainPage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 25, 2021

import Foundation

struct MainPage : Codable {

        let data : MainDatum?
        let message : String?
        let status : Int?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case message = "message"
                case status = "status"
                case type = "type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try MainDatum(from: decoder)
                message = try values.decodeIfPresent(String.self, forKey: .message)
                status = try values.decodeIfPresent(Int.self, forKey: .status)
                type = try values.decodeIfPresent(String.self, forKey: .type)
        }

}
