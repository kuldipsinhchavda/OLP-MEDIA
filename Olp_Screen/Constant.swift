//
//  Constant.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 21/05/21.
//

import Foundation

let MAIN_URL = "http://olp-media.com/"

let LOGIN_URL = "api/v1/login"

let FORGET_URL = "api/v1/forgot_password"

let SIGNIN_URL = "api/v1/sign_up"

let LOGOUT_URL = "api/v1/logout"

let CATEGORY_URL = "api/v1/categories?page=1"

let UPLOADPIC_URL = "api/v1/upload_profile"

let USERDETAILS_URL = "api/v1/users/user_detail"

let VIDEOSAPI = "api/v1/videos"

let EDITUSERURL = "api/v1/users/edit_user"

let CATEGORYDETAILSURL = "api/v1/categories/category_details?category_id=1&page=1"

struct UserDefaults {
    static var authToken = ""
    
    static var userId : Int?
    
    static var categoryId : Int?
}
