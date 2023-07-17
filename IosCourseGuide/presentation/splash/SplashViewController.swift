//
//  SplashViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController{

    var initialViewController : UIViewController?
    private var viewModel = SplashViewModel()
    let diposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_splash.png")!)
        
        viewModel.successToken.subscribe(onNext: {token in
            self.successToken(token: token)}).disposed(by:diposeBag)
        viewModel.getTokenTwo()
    }
   
    func successToken(token: Bool) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if(token){
                    self.initialViewController = HomeNavigation.newInstance(usingNavigationFactory: NavigationCustom.build)
                }else{
                   
                    self.initialViewController = LoginNavigation.newInstance(usingNavigationFactory: NavigationCustomToolbar.build)
                   
                }
                self.normalSetRoot(window: self.view.window, initialViewController: self.initialViewController)
      }
       
  }
    
    func normalSetRoot(window: UIWindow?, initialViewController: UIViewController?){
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }

}


class SplashNavigation {
    
//    para poder Navegar
    static func newIntance(usingNavigationFactory factory : NavigationFactory) -> UINavigationController{
        let storyboard = UIStoryboard(name: "Splash", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        return factory(view)
    }
    
}

