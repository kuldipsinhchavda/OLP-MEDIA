//
//  UserData+CoreDataProperties.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 03/05/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var full_Name: String?
    @NSManaged public var user_Name: String?
    @NSManaged public var country: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var bio: String?
    @NSManaged public var user_Dp: String?

}

extension UserData : Identifiable {

}
