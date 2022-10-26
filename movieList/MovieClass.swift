//
//  MovieClass.swift
//  movieList
//
//  Created by JAMES DURCAN on 10/20/22.
//

import Foundation

class MovieClass{
    
    
   var title = ""
    var year = 0
    var rating = 0
    init(inTitle: String, inYear: Int, inRating: Int){
        title = inTitle
        year = inYear
        rating = inRating
    }
}
