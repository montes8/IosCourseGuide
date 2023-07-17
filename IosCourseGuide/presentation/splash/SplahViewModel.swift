//
//  SplahViewModel.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 17/07/23.
//

import Foundation
import RxSwift

class  SplashViewModel{
    
    var successToken = PublishSubject<Bool>()
   
    
    func getToken() -> Observable<Bool>{
        return Observable.create{observer -> Disposable in
            var token = AppUseCase.getToke()
            observer.onNext(token)
            return Disposables.create {}
        }
        
    }
    
    func getTokenTwo(){
        var token = AppUseCase.getToke()
        successToken.onNext(token)
        successToken.onCompleted()
        
    }
    
}
