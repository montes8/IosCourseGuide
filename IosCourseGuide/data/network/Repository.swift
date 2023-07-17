//
//  Repository.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 15/07/23.
//

import Foundation
import Alamofire

class Repository{
    
    static func requestService<T: Decodable>(_ urlString: String,
                                               method: HTTPMethod,
                                               params: Parameters?,
                                               header: HTTPHeaders?,
                                               interceptor: RequestInterceptor?,
                                               type: T.Type,
                                               completion: @escaping (T?, String?) -> Void) {

       let urlService = "https://8236-2800-200-e3c0-1123-ec7d-fca6-2a9c-85d1.ngrok-free.app/api/user/loadRecipes"
       
       AF.request(urlService, method: method, parameters: params, encoding:
                   URLEncoding.default, headers: header, interceptor: interceptor).response{ response in
           
           switch response.result {
           case .success(let data):
               do{
                   let responseService = try JSONDecoder().decode(type.self, from: data ?? Data())
                  
                    completion(responseService, nil)
        
               }catch{
                   completion(nil, "Error al decodificar")
               }
               
           case .failure(let error):
               print(error.localizedDescription)
               completion(nil, "Error al obtener datos")
           }
           
          }
       }
}
