//
//  UserModel.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import Foundation
import CoreData


struct UserModel : Codable {
    var id : Int = 0
    var name : String = ""
    var pass : String = ""
    
    
    static func loadUser(entity : [NSManagedObject]?) -> UserModel?{
        var user : [UserModel] = []
        for data in entity as [NSManagedObject]{
            user.append(UserModel(id: data.value(forKey: "id") as! Int,
                                  name: data.value(forKey: "name") as! String,
                                  pass: data.value(forKey: "password") as! String))
        }
        return user[0]
    }
}
