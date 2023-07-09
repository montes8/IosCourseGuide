//
//  LoginViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRegister" {
            let objDestino = segue.destination as!RegisterViewController
        }
    }

}
