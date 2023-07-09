//
//  ViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit

class SplashViewController: UIViewController,ILoginPresenter {
    
       
    var presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegado = self
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_splash.png")!)
       // UserDefaults.standard.set(true, forKey: "KeyToken")
        presenter.getToken()
        
    
        //self.showErrorMessage(valid){_ in}
        //DispatchQueue.main.asyncAfter(deadline: .now() + 3) {self.performSegue(withIdentifier: "nextLogin", sender:self)}
       //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextLogin" {
            let objDestino = segue.destination as!LoginViewController
        }
    }
    
    func successToken(token: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "nextLogin", sender:self)
            if(token){
                
            }else{
               
            }
          
        }
    }
}



