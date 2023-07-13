//
//  LoginPresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 9/07/23.
//

import Foundation
import RxSwift

class SplashPresenter{
    var delegado : ISplashPresenter?
    
    func getToken() {
        delegado?.successToken(token: UserDefaults.standard.bool(forKey: "KeyToken"))
    }
}


protocol ISplashPresenter {
    func successToken(token: Bool)
}



class  SplashViewModel{
    
    var successToken = PublishSubject<Bool>()
    
    func getToken() -> Observable<Bool>{
        return Observable.create{observer -> Disposable in
            var token = UserDefaults.standard.bool(forKey: "KeyToken")
            observer.onNext(token)
            return Disposables.create {}
        }
        
    }
    
    func getTokenTwo(){
        successToken.onNext(UserDefaults.standard.bool(forKey: "KeyToken"))
        successToken.onCompleted()
        
    }
    
}
