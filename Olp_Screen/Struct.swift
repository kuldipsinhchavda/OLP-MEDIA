//
//  Struct.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 31/05/21.
//

import Foundation
import UIKit
struct mainModel {
    
    var title: String
    var image: String
    var series: String
    var createdAt:String
   
    
    init(title: String,image:String,series:String,createdAt:String) {
        
        self.title = title
        self.series = series
        self.image = image
        self.createdAt = createdAt
    }
}
struct advertiseCoder {
    
    let topicName : String?
    let ExternalUrl : String?
    let urlImage : String?
    let desc : String?
    
    init(topicName : String,externalUrl : String,image: String , desc: String) {
        
        self.topicName = topicName
        self.ExternalUrl = externalUrl
        self.urlImage = image
        self.desc = desc
    }
    
}
struct categoryModel {
   
    var title: String
    var image: String
    var des: String
    var categoryId : Int
    
    init(title: String,image:String,desc:String, categoryId : Int ) {
        
        self.title = title
        self.des = desc
        self.image = image
        self.categoryId = categoryId
    }
}
struct signInField {
    
    let bio : String?
    let country : String?
    let createdAt : String?
    let email : String?
    let fullName : String?
    let id : Int?
    let newsletter : String?
    let profilePic : String?
    let rememberCreatedAt : String?
    let resetPasswordSentAt : String?
    let resetPasswordToken : String?
    let status : String?
    let updatedAt : String?
    let userName : String?
    
    
    
    init(id: Int, email: String, fullName: String, userName: String, country: String, profilePic: String, newsletter: String, resetPasswordToken: String, resetPasswordSentAt: String, rememberCreatedAt: String, createdAt: String, updatedAt: String, status: String, bio: String) {
            self.id = id
            self.email = email
            self.fullName = fullName
            self.userName = userName
            self.country = country
            self.profilePic = profilePic
            self.newsletter = newsletter
            self.resetPasswordToken = resetPasswordToken
            self.resetPasswordSentAt = resetPasswordSentAt
            self.rememberCreatedAt = rememberCreatedAt
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.status = status
            self.bio = bio
        }

}
struct logInField {
    
    let bio : String?
    let country : String?
    let createdAt : String?
    let email : String?
    let fullName : String?
    let id : Int?
    let newsletter : String?
    let profilePic : String?
    let rememberCreatedAt : String?
    let resetPasswordSentAt : String?
    let resetPasswordToken : String?
    let status : String?
    let updatedAt : String?
    let userName : String?
    
    
    
    init(id: Int, email: String, fullName: String, userName: String, country: String, profilePic: String, newsletter: String, resetPasswordToken: String, resetPasswordSentAt: String, rememberCreatedAt: String, createdAt: String, updatedAt: String, status: String, bio: String) {
            self.id = id
            self.email = email
            self.fullName = fullName
            self.userName = userName
            self.country = country
            self.profilePic = profilePic
            self.newsletter = newsletter
            self.resetPasswordToken = resetPasswordToken
            self.resetPasswordSentAt = resetPasswordSentAt
            self.rememberCreatedAt = rememberCreatedAt
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.status = status
            self.bio = bio
        }

}
struct save {
    
    var title: String
    var image: String
    var des: String
    
    init(title: String,image:String,desc:String) {
        
        self.title = title
        self.des = desc
        self.image = image
    }
}
struct userDetails {
    
    var email : String?
    var fullName : String?
    var date : String
    var bio : String?
   
    
    
    init(email: String , fullName : String , date: String  , bio : String) {
        
        self.email = email
        self.fullName = fullName
        self.date = date
        self.bio = bio
       
    }
    
    
}
struct profilePhoto {
    
    let image  : UIImage?
    
    init(image:UIImage) {
        
        self.image = image
    }
}
