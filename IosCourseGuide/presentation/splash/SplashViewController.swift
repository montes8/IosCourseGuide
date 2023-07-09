//
//  ViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_splash.png")!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "nextLogin", sender:self)
        }
       //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextLogin" {
            let objDestino = segue.destination as!LoginViewController
        }
    }


}

