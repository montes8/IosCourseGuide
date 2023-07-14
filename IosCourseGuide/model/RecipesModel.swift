//
//  RecipesModel.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 13/07/23.
//

import Foundation

struct RecipesModel : Codable{
    var id : Int = 0
    var title : String = ""
    var description : String = ""
    var preparation : String = ""
    var urlImg : String = ""
    var institute : String = ""
    var addressInstitute : String = ""
    var latitude : String = ""
    var longitude : String = ""
}
