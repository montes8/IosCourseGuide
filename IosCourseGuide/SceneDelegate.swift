//
//  SceneDelegate.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 8/07/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        var initialViewController : UIViewController?
        initialViewController = SplashNavigation.newIntance(usingNavigationFactory: NavigationCustom.build)
        
        normalSetRoot(window: window, initialViewController: initialViewController)
        guard let _ = (scene as? UIWindowScene) else { return }
   }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
   }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
   }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    func normalSetRoot(window: UIWindow?, initialViewController: UIViewController?){
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }


}

