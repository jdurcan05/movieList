//
//  MovieScreen.swift
//  movieList
//
//  Created by JAMES DURCAN on 10/26/22.
//

import UIKit

class MovieScreen: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textFieldDescription: UITextView!
    var newTitle: String = ""
    var newDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = newTitle
        textFieldDescription.text = newDescription
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Red Dissapear")
        newDescription = textFieldDescription.text
        performSegue(withIdentifier: "unwind", sender: self)
        
    }

}
