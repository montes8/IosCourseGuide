//
//  RegisterPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 10/07/23.
//

import Foundation
import UIKit


class RegisterPresenter{
    var delegado : IRegisterPresenter?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func loadRegister(_ user:String,_ pass: String) {
        
        if user == "" || pass == ""{
            delegado?.errorRegister("Debes ingresar los datos completos")
            
        }else{
            
            let success = DataBaseCourse.saveUserEntity(context: context, user: user, pass: pass)
            if success {
                delegado?.errorRegister("Usuario Registrado")
            }else{
                delegado?.errorRegister("No se pudo guardar el usuario")
            }
        }
        
       
    }
}


protocol IRegisterPresenter {
    func successRegister(_ value: String)
    func errorRegister(_ value: String)
}
