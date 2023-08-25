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
        let urlService = "https://d9a5-2800-200-e3c0-1123-484c-49cf-9d59-6617.ngrok-free.app/service/user/loadRecipes"
        
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
