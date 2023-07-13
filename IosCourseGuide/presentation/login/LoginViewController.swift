//
//  LoginViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit
import MaterialComponents
import CoreData


class LoginViewController: UIViewController, UITextFieldDelegate,ILoginPresenter{
   
    @IBOutlet weak var editUser: UITextField!
    @IBOutlet weak var editPass: UITextField!
    
    var presenter = LoginPresenter()
    
    var result = [UserEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editUser.delegate = self
        self.editPass.delegate = self
        editUser.heightAnchor.constraint(equalToConstant: 56).isActive = true
        editPass.heightAnchor.constraint(equalToConstant: 56).isActive = true
        editPass.isSecureTextEntry = true
        presenter.delegado = self
       
    }
    
    func successLogin() {
        self.showErrorMessage("usuario logeado"){_ in}
        
    }
    
    func errorLogin(_ value: String) {
        self.showErrorMessage(value){_ in}
    }
    
    
    @IBAction func onClickRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "nextRegister", sender:self)
    }
    
    @IBAction func onClickLogin(_ sender: UIButton) {
        presenter.loadLogin(editUser.text ?? "",editPass.text ?? "")
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editUser.resignFirstResponder()
        self.editPass.resignFirstResponder()
        return false
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRegister" {
            let objDestino = segue.destination as!RegisterViewController
        }
    }

}

