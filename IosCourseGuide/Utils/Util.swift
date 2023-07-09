//
//  Util.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 9/07/23.
//
import UIKit

import Foundation

extension UIViewController {

    func showErrorMessage(_ message: String,completionHandler:@escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            if action.style == .cancel{
                completionHandler(true)
            }
            
        }))
    
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                completionHandler(false)
            
        }))
        
        self.present(alert, animated: true)
    }
}
