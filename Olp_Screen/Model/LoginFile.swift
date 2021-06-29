//
//  LoginFile.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 20, 2021

import Foundation

struct LoginFile : Codable {

        let data : LoginDatum?
        let message : String?
        let status : Int?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case message = "message"
                case status = "status"
                case type = "type"
        }
    
      

}
