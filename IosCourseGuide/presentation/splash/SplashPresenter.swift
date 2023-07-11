//
//  LoginPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 9/07/23.
//

import Foundation

class SplashPresenter{
    var delegado : ISplashPresenter?
    
    func getToken() {
        delegado?.successToken(token: UserDefaults.standard.bool(forKey: "KeyToken"))
    }
}


protocol ISplashPresenter {
    func successToken(token: Bool)
}
