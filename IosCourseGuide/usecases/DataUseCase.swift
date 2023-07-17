//
//  DataUseCase.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 17/07/23.
//

import Foundation


class DataUseCase {
    
    static func getList(completion: @escaping ([RecipesModel]?, String?) -> Void){
        
        Repository.requestService(URL_BASE,method: .get,params: nil,
                                  header: nil,interceptor: nil,type: [RecipesResponse].self){ data, error in
           
                completion(RecipesResponse.loadListRecipe(response: data ?? []),error)
              
        }
    }
}
