//
//  HomeViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class HomeNavigation {
    
    static func newInstance(usingNavigationFactory factory : NavigationFactory) -> UINavigationController{
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return factory(view)
    }
}
