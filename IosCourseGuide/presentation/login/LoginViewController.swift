//
//  LoginViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit
import MaterialComponents
import CoreData


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var editUser: UITextField!
    
    @IBOutlet weak var editPass: UITextField!
    
    var result = [UserEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editUser.delegate = self
        self.editPass.delegate = self
        editUser.heightAnchor.constraint(equalToConstant: 56).isActive = true
        editPass.heightAnchor.constraint(equalToConstant: 56).isActive = true
        editPass.isSecureTextEntry = true
        
        let fetchRequest : NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
      
        do {
            //result = try context.fetch(fetchRequest)
          
            
            //fetchRequest.predicate =  NSPredicate(format: "name CONTAINS 'Tayler'")
            fetchRequest.predicate = NSCompoundPredicate(type:.and, subpredicates:[
                NSPredicate(format: "name == %@", "Tayler"),
                NSPredicate(format: "password == %@", "tayler")])
            result = try context.fetch(fetchRequest)
            for data in result as [NSManagedObject]{
            var name = data.value(forKey: "name")
                var pass = data.value(forKey: "password")
                print(name)
                print(pass)
           }
           
           
        }catch {
            print(error.localizedDescription)
        }
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editUser.resignFirstResponder()
        self.editPass.resignFirstResponder()
        return false
       
    }
    
    @IBAction func onClickRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "nextRegister", sender:self)
    }
    
    @IBAction func onClickLogin(_ sender: UIButton) {
        if self.editUser.text == "gabbi" && self.editPass.text == "gabbi"{
            
        }else{
            self.showErrorMessage("Usuario incorrecto"){_ in}
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRegister" {
            let objDestino = segue.destination as!RegisterViewController
        }
    }

}

