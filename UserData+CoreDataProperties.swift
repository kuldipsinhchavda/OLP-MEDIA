//
//  UserData+CoreDataProperties.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 07/05/21.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var user_Name: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var full_Name: String?
    @NSManaged public var country: String?
    @NSManaged public var dataToPhoto: NSSet?

}

// MARK: Generated accessors for dataToPhoto
extension UserData {

    @objc(addDataToPhotoObject:)
    @NSManaged public func addToDataToPhoto(_ value: UserPhoto)

    @objc(removeDataToPhotoObject:)
    @NSManaged public func removeFromDataToPhoto(_ value: UserPhoto)

    @objc(addDataToPhoto:)
    @NSManaged public func addToDataToPhoto(_ values: NSSet)

    @objc(removeDataToPhoto:)
    @NSManaged public func removeFromDataToPhoto(_ values: NSSet)

}

extension UserData : Identifiable {

}
