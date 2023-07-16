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
    
    func loadLogin(_ user:String,_ pass: String) {
        
        if user.isEmpty || pass.isEmpty{delegado?.errorLogin("Debes completar todos los campos")
        }else{
            DataBaseCourse.validateLogin(context: context,user: user,pass: pass){ data ,error in
                      if error != nil{
                          self.delegado?.errorLogin(error ?? "")
                      }else{
                          self.delegado?.successLogin(user: UserModel.loadUser(entity: data) ?? nil)
                    }
                }
            }
        }
      
}


protocol ILoginPresenter {
    func successLogin(user : UserModel?)
    func errorLogin(_ value: String)
}
