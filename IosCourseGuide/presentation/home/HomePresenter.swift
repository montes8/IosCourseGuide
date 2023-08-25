//
//  HomePresenter.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 13/07/23.
//

import Foundation

class HomePresenter{
    var delegado : IHomePresenter?
    
    func getList() {
        let urlService = "https://d9a5-2800-200-e3c0-1123-484c-49cf-9d59-6617.ngrok-free.app/service/user/loadRecipes"
        
        if let url = URL(string: urlService){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){data,response,error in
                if error != nil{
                    
                    print("Error al obtener datos")
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.delegado?.errorService(message: "Error al obtener datos")
                    }
                }
                
                if let dataListResponse = data?.parseDataList(){
                    if let listFinalize = self.parseJsonList(datosServices : dataListResponse){
                        print("lista servicios", listFinalize)
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.delegado?.loadList(list: listFinalize)
                        }
                    }
                }
                
            }
            
            task.resume()
        }
        
        
    }
    
    func parseJsonList(datosServices : Data) -> [RecipesModel]?{
        let decodificador = JSONDecoder()
        do{
            
            let dataDecodificada = try decodificador.decode([RecipesModel].self,from: datosServices)
            return dataDecodificada
        }catch{
            print("Error al decodificar")
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.delegado?.errorService(message: "Error al decodificar")
            }
          
            return nil
        }
        
    }
    
    func parseDataList(_ dataModel : Data) -> Data?{
        let dataString = String(data: dataModel, encoding: .utf8)
        guard let data = dataString?.data(using: .utf8) else { return nil }
        return data
    }
}

extension Data {
    func parseDataList() -> Data?{
        let dataString = String(data: self, encoding: .utf8)
        guard let data = dataString?.data(using: .utf8) else { return nil }
        return data
    }
    
}


protocol IHomePresenter {
    func loadList(list: [RecipesModel])
    func errorService(message: String)
}
