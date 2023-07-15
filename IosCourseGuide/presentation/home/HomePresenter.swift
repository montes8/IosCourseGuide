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
        
        AF.request(urlService, method: .get, parameters: nil, encoding:
                    URLEncoding.default, headers: nil, interceptor: nil).response{ response in
            
            switch response.result {
            case .success(let data):
                do{
                    let listFinalize = try JSONDecoder().decode([RecipesModel].self, from: data ?? Data())
                    print("lista servicios", listFinalize)
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.delegado?.loadList(list: listFinalize)
                    }
                }catch{
                    self.delegado?.errorService(message: "Error al decodificar")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.delegado?.errorService(message: "Error al obtener datos")
            }
            
        }
        
    }
    
}


protocol IHomePresenter {
    func loadList(list: [RecipesModel])
    func errorService(message: String)
}
