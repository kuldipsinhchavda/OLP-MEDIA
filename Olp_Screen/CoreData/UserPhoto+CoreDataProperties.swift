//
//  UserPhoto+CoreDataProperties.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 07/05/21.
//
//

import Foundation
import CoreData


extension UserPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPhoto> {
        return NSFetchRequest<UserPhoto>(entityName: "UserPhoto")
    }

    @NSManaged public var photo: Data?
    @NSManaged public var bio: String?
    @NSManaged public var userPhotoUserData: UserData?

}

extension UserPhoto : Identifiable {

}
