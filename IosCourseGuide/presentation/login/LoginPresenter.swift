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
                          self.delegado?.successLogin()
                    }
                }
            }
        }
      
}


protocol ILoginPresenter {
    func successLogin()
    func errorLogin(_ value: String)
}
