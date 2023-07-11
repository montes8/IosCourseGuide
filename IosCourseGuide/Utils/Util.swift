//
//  Util.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 9/07/23.
//
import UIKit

import Foundation

extension UIViewController {

    func showErrorMessage(_ message: String,_ flag: Bool = true,completionHandler:@escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)

        if(flag){
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                    completionHandler(false)
                
            }))
        }
      
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                completionHandler(true)
            
        }))
    
       
        
        self.present(alert, animated: true)
    }
}
