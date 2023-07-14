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
    //private var viewModel = SplashViewModel()
    let diposeBag = DisposeBag()

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
        
        //   viewModel.getToken().subscribe(onNext: {token in self.successToken(token: token)}
        // ).disposed(by:diposeBag)
        //viewModel.successToken.subscribe(onNext: {token in
            //self.successToken(token: token)}).disposed(by:diposeBag)
        //viewModel.getTokenTwo()
      
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



