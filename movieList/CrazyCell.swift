//
//  CrazyCell.swift
//  movieList
//
//  Created by JAMES DURCAN on 10/20/22.
//
import UIKit
import Foundation

class CrazyCell: UITableViewCell{
    
    var movie = MovieClass(inTitle: "", inYear: 0, inRating: 0)
    @IBOutlet weak var movieTitleLabelOutlet: UILabel!
    @IBOutlet weak var ratingOutlet: UILabel!
    @IBOutlet weak var yearReleasedOutlet: UILabel!
    
    func configure (inMovie: MovieClass){
        movie = inMovie
        movieTitleLabelOutlet.text = movie.title
        ratingOutlet.text = "\(movie.rating)"
        yearReleasedOutlet.text = "\(movie.year)"
    }
}
