//
//  LoginViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import UIKit

class LoginViewController: UIViewController,ILoginPresenter {
  

    @IBOutlet weak var userEdit: UITextField!
    @IBOutlet weak var passEdit: UITextField!
    
    @IBOutlet weak var textTitle: UILabel!
    
    var presenter = LoginPresenter()
    
    var titleLogin = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEdit.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passEdit.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passEdit.isSecureTextEntry = true
        presenter.delegado = self
        textTitle.text = titleLogin
    }
    
    func successLogin(user: UserModel?) {
        
    }
    
    func errorLogin(_ value: String) {
        self.showErrorMessage(value){_ in}
    }
    
    
    @IBAction func onClickNextRegister(_ sender: Any) {
        
   
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        presenter.loadLogin(userEdit.text ?? "",passEdit.text ?? "")
    }
}


class LoginNavigation {
    
//    para poder Navegar
    static func newInstance(usingNavigationFactory factory : NavigationFactory) -> UINavigationController{
        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        view.titleLogin = "Hola Gabbi"
        return factory(view)
    }
    
}
