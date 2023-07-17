//
//  ManagerUserDefault.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 17/07/23.
//

import Foundation

class ManagerUserDefaultt {
    
    static func getToken() -> Bool {
        return UserDefaults.standard.bool(forKey: TOKEN_USER_DEFAULT)
    }
    
    static func saveToken(token: Bool) {
        UserDefaults.standard.set(token, forKey: TOKEN_USER_DEFAULT)
    }
    
}
