//
//  NavigationBuilder.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) ->(UINavigationController)

class NavigationCustom{
    static func build(rootView : UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
class NavigationCustomToolbar{
    static func build(rootView : UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.isHidden = false
        return navigationController
    }
}
