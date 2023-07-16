//
//  RecipesResponse.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import Foundation


struct RecipesResponse : Codable{
    var id : Int = 0
    var title : String = ""
    var description : String = ""
    var preparation : String = ""
    var urlImg : String = ""
    var institute : String = ""
    var addressInstitute : String = ""
    var latitude : String = ""
    var longitude : String = ""
    
    
    static func loadListRecipe(response : [RecipesResponse])->[RecipesModel]{
        
        var list :[RecipesModel] = []
        for data in response {
            list.append(RecipesModel(id: data.id,title: data.title,description: data.description
                                     ,preparation: data.urlImg,urlImg: data.institute,institute: data.addressInstitute,
                                     addressInstitute: data.latitude,latitude: data.longitude))
        }
        return list
    }
}

