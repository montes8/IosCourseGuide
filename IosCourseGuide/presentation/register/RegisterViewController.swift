//
//  RegisterViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

class RegisterNavigation {
    
    static func newInstance(usingNavigationFactory factory : NavigationFactory) -> UINavigationController{
        let storyboard = UIStoryboard(name: "Register", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        return factory(view)
    }
}
