//
//  HomePresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 13/07/23.
//

import Foundation
import Alamofire

class HomePresenter{
    var delegado : IHomePresenter?
    
    func getList() {
        let urlService = "https://8236-2800-200-e3c0-1123-ec7d-fca6-2a9c-85d1.ngrok-free.app/api/user/loadRecipes"
        
        Repository.requestService(urlService,method: .get,params: nil,
                                  header: nil,interceptor: nil,type: [RecipesResponse].self){ data, error in
            
            if error != nil {
                self.delegado?.errorService(message: error ?? "Error al obtener datos")
            }else{
                self.delegado?.loadList(list: RecipesResponse.loadListRecipe(response: data ?? []))
            }
            
        }
        
    }
    
}


protocol IHomePresenter {
    func loadList(list: [RecipesModel])
    func errorService(message: String)
}
