//
//  DataBaseCourse.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 15/07/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseCourse {
    
    static func validateLogin(context : NSManagedObjectContext,user : String, pass:String,
                              completion: @escaping ([NSManagedObject]?, String?) -> Void) {
         let fetchRequest : NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        let query = [NSPredicate(format: "name == %@", user),NSPredicate(format: "password == %@", pass)]

        do {
            if !query.isEmpty {fetchRequest.predicate = NSCompoundPredicate(type:.and, subpredicates:query)}
                var data = try context.fetch(fetchRequest)
                
               if data.isEmpty{
                   completion(nil,"El usuario no esta registrado")
                }else{
                    completion(data,nil)
                }
               
            }catch {
                print(error.localizedDescription)
                completion(nil,"Ocurrio un error intentalo mas tarde")
            
            }
       }
    
    static func saveUserEntity(context : NSManagedObjectContext,user : String , pass : String )-> Bool {
        let userEntity = UserEntity(context: context)
        userEntity.id = Int16.random(in: 10...20)
        userEntity.name = user
        userEntity.password = pass
        do {
            try context.save()
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
}
