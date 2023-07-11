//
//  RegisterViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 10/07/23.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate,IRegisterPresenter {
    
    
    @IBOutlet weak var editRegisterUser: UITextField!
    @IBOutlet weak var editRegisterPass: UITextField!
    
    
     var presenter = RegisterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editRegisterUser.delegate = self
        self.editRegisterPass.delegate = self
        self.editRegisterUser.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.editRegisterPass.heightAnchor.constraint(equalToConstant: 56).isActive = true
        presenter.delegado = self
    }
    

    @IBAction func onClickSuccessRegister(_ sender: UIButton) {
        presenter.loadRegister(editRegisterUser?.text ?? "", editRegisterPass?.text ?? "")
    }
    
    func successRegister(_ value: String) {
        showErrorMessage(value,false){_ in
            print("successRegister")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func errorRegister(_ value: String) {
        showErrorMessage(value,false){_ in }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editRegisterUser.resignFirstResponder()
        self.editRegisterPass.resignFirstResponder()
           return false
       }

}
