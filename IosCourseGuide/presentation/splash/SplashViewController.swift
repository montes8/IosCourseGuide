//
//  ViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController,ISplashPresenter
{
    
       
    var presenter = SplashPresenter()
    let diposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegado = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_splash.png")!)
       presenter.getToken()
    }
    
    func successToken(token: Bool) {
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if(token){
                self.performSegue(withIdentifier: "nextHomeStart", sender: AnyObject.self)
            }else{
                self.performSegue(withIdentifier: "nextLogin", sender: AnyObject.self)
               
            }
          
        }
    }
}



