//
//  LoginPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 10/07/23.
//

import Foundation
import UIKit
import CoreData

class LoginPresenter{
    var delegado : ILoginPresenter?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result = [UserEntity]()
    
    func loadLogin(_ user:String,_ pass: String) {
        let fetchRequest : NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        if user.isEmpty || pass.isEmpty{
            delegado?.errorLogin("Debes completar todos los campos")
        }else{
            do {
                //result = try context.fetch(fetchRequest)
                //fetchRequest.predicate =  NSPredicate(format: "name CONTAINS 'Tayler'")
                fetchRequest.predicate = NSCompoundPredicate(type:.and, subpredicates:[
                    NSPredicate(format: "name == %@", user),
                    NSPredicate(format: "password == %@", pass)])
                result = try context.fetch(fetchRequest)
                for data in result as [NSManagedObject]{
                var name = data.value(forKey: "name")
                    var pass = data.value(forKey: "password")
                    print(name ?? "")
                    print(pass ?? "")
               }
                
               if result.isEmpty{
                    delegado?.errorLogin("El usuario n0 esta registrado")
                }else{
                    UserDefaults.standard.set(true, forKey: "KeyToken")
                    delegado?.successLogin()
                }
               
            }catch {
                print(error.localizedDescription)
                delegado?.errorLogin("Ocurrio un error intentalo mas tarde")
            }
        }
      
       
    }
}


protocol ILoginPresenter {
    func successLogin()
    func errorLogin(_ value: String)
}
