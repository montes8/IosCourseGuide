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
            let userEntity = UserEntity(context: self.context)
            userEntity.id = Int16.random(in: 10...20)
            userEntity.name = user
            userEntity.password = pass
            do {
                try context.save()
                delegado?.successRegister("Usuario registrado")
            }
            catch {
                print(error.localizedDescription)
                delegado?.errorRegister("Error al registarse")
            }
        }
        
       
    }
}


protocol IRegisterPresenter {
    func successRegister(_ value: String)
    func errorRegister(_ value: String)
}
