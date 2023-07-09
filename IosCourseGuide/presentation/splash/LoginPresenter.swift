//
//  LoginPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 9/07/23.
//

import Foundation

class LoginPresenter{
    var delegado : ILoginPresenter?
    
    func getToken() {
        delegado?.successToken(token: UserDefaults.standard.bool(forKey: "KeyToken"))
    }
}


protocol ILoginPresenter {
    func successToken(token: Bool)
}
