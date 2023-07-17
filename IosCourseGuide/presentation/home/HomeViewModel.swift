//
//  HomeViewModel.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 17/07/23.
//

import Foundation
import RxSwift

class  HomeViewModel{
    
    var successList = PublishSubject<[RecipesModel]>()
    var errorList = PublishSubject<String>()
   

    func getlistHome(){
        
        DataUseCase.getList(){data,error in
            
            if data != nil{
                self.successList.onNext(data ?? [])
                self.successList.onCompleted()
                print("data servicio", data ?? [])
            }else{
                self.errorList.onNext(error ?? "")
                self.errorList.onCompleted()
                print("data servicio", error ?? "")
            }
        }
    }
    
}
