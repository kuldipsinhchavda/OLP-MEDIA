
//  coreData.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 03/05/21.


import Foundation
import UIKit
import CoreData

class coreDataModel {
    
    static let instance = coreDataModel()
    private static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var user : [UserData]?
    
    public func setData(fName: String , uName: String , country:String , email:String , password: String) -> Bool {
        
        do {
            
            let newData = UserData(context: coreDataModel.context)
            
            newData.full_Name = fName
            newData.user_Name = uName
            newData.country = country
            newData.email = email
            newData.password = password
            //newData.bio = bio
            
            try coreDataModel.context.save()
        } catch  {
            
        }
        
        return true
        
    }
    
   
    
//    public func setPhoto(user:UserData ,uPhoto : Data) -> Bool
//
//    {
//        do {
//            let newPhoto = UserPhoto(context: coreDataModel.context)
//
//            newPhoto.photo = uPhoto
//            
//            user.addToDataToPhoto(newPhoto)
//
//            try coreDataModel.context.save()
//        } catch  {
//
//        }
//
//        return true
//
//
//    }
    public func fetchOneUser(email:String) -> UserData
    {
        let user:UserData?
        let predicte = NSPredicate(format: "email =%@", email)
        let fetchReq = NSFetchRequest<NSFetchRequestResult> (entityName: "UserData")
        fetchReq.predicate = predicte
        let fetchRequest = try! coreDataModel.context.fetch(fetchReq)
        
        if fetchRequest.count > 0 {
            
            user = fetchRequest.first as? UserData
            return user!
        }
        user = UserData()
        
        return user!
        
        
    }
    
    public func saveImg (at sImage : Data) {
        
      //
        //let profile = NSEntityDescription.insertNewObject(forEntityName: "UserPhoto", into: coreDa_text) as! UserPhoto
       // let newImage = UserData(context: coreDataModel.context)
    
       // profile.photo = sImage
        
        do {
            try coreDataModel.context.save()
        } catch let error {
            print(error.localizedDescription)
        }
      
    }
    public func getImage() -> UserData {
        
        var uImage : UserData?
        let fetchReq = NSFetchRequest<NSFetchRequestResult> (entityName: "UserData")
       
        do {
            let fetchRequest = try coreDataModel.context.fetch(fetchReq) as! [UserData]
            
            if fetchRequest.count > 0 {
                
                uImage = fetchRequest.first
                return uImage!
            }
        } catch let error {
            print(error.localizedDescription)
        }
        uImage = UserData()
        return uImage!
        
    }
//    func imagesFromCoreData(object: Data?) -> [UIImage]? {
//        var retVal = [UIImage]()
//
//        guard let object = object else { return nil }
//        if let dataArray = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: object) {
//            for data in dataArray {
//                if let data = data as? Data, let image = UIImage(data: data) {
//                    retVal.append(image)
//                }
//            }
//        }
//        
//        return retVal
//    }
    public func editBio(bio:String) -> Bool {
        
        do {
            
            _ = UserData(context: coreDataModel.context)
            //newBio.bio = bio
            
            try coreDataModel.context.save()
        } catch  {
            
        }
        return true
    }
    
    public func checkUser (email: String, password: String) -> Bool {
        
        
        let predicte = NSPredicate(format: "email =%@", email)
        let fetchReq = NSFetchRequest<NSFetchRequestResult> (entityName: "UserData")
        
        fetchReq.predicate = predicte
        
        let fetchRequest = try! coreDataModel.context.fetch(fetchReq)
        
        if fetchRequest.count > 0{
            
            let objectEntity : UserData = fetchRequest.first as! UserData
            
            if objectEntity.email == email || objectEntity.password == password{
                
                return true
            }
            else {
                return false
            }
            
        }
        else{
            
            return false
        }
        
    }
}
