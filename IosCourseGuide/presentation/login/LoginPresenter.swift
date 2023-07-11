//
//  LoginPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 10/07/23.
//

import Foundation
import UIKit

class LoginPresenter{
    var delegado : ILoginPresenter?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func loadLogin(_ user:String,_ pass: String) {
        
        
       
    }
}


protocol ILoginPresenter {
    func successLogin()
    func errorLogin(_ value: String)
}
