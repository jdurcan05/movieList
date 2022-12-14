//
//  ViewController.swift
//  movieList
//
//  Created by JAMES DURCAN on 10/19/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var rowPick = 0
    var titleList = ["Double Down", "Fateful Findings", "Star wars", "Hot fuzz", "Paddleton", "Scott Pilgrim vs. The World", "The Dark Knight", "A Barbie Christmas", "Rudolph the Red Nosed Reindeer", "James Bond", "Spiderman", "Cars"]
    var yearList = [2008,2007,1979, 2009, 2012, 2010, 2012, 2011, 1985, 1776, 2002, 2005]
    var ratingsList = [3,5,4,4,2,5,5,5,4,4,4,5]
    
    var movieList = [MovieClass]()
    let encoder = JSONEncoder()
    
    @IBOutlet weak var addTextOutlet: UITextField!
    @IBOutlet weak var yearOutlet: UITextField!
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var ratingOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        for i in 0..<titleList.count {
            let m1 = MovieClass(inTitle: titleList[i], inYear: yearList[i], inRating: ratingsList[i])
            movieList.append(m1)
            
        }
        if let items = UserDefaults.standard.data(forKey: "myMovies") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([MovieClass].self, from: items) {
                movieList = decoded
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! CrazyCell
        cell.configure(inMovie: movieList[indexPath.row])
        return cell
    }
    @IBAction func addMovieButton(_ sender: UIBarButtonItem) {
        if(addTextOutlet.text != ""){
            movieList.append(MovieClass(inTitle: addTextOutlet.text!, inYear: Int(yearOutlet.text ?? "0") ?? 0, inRating: Int(ratingOutlet.text ?? "0") ?? 0))
            tableViewOutlet.reloadData()
            if let encoded = try? encoder.encode(movieList) {
                UserDefaults.standard.set(encoded, forKey: "myMovies")
            }
        }
    }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                movieList.remove(at: indexPath.row)
                if let encoded = try? encoder.encode(movieList) {
                    UserDefaults.standard.set(encoded, forKey: "myMovies")}
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                }
                
            }
            
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                rowPick = indexPath.row
                performSegue(withIdentifier: "tableClick", sender: nil)
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let nvc = segue.destination as! MovieScreen
                nvc.newTitle = movieList[rowPick].title
                nvc.newDescription = movieList[rowPick].description
                print(movieList[rowPick].description)
            }
            
            @IBAction func unwind(_ seg:UIStoryboardSegue){
                print("unwind")
                let svc = seg.source as! MovieScreen
                movieList[rowPick].description = svc.newDescription
                print (movieList[rowPick].description)
                if let encoded = try? encoder.encode(movieList) {
                    UserDefaults.standard.set(encoded, forKey: "myMovies")
                }
            }
    }
