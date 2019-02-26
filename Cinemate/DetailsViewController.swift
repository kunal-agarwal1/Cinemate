//
//  DetailsViewController.swift
//  Cinemate
//
//  Created by Kunal Agarwal on 19/02/19.
//  Copyright © 2019 Kunal. All rights reserved.
//

import UIKit
import AlamofireImage
//import QuartzCore/QuartzCore.h

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    var movie: [String: Any]!
    var key: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        releaseDateLabel.text = "Released: " + ((movie["release_date"] as? String)!)


        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)

        posterView.af_setImage(withURL: posterUrl!)
        posterView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0).cgColor
        posterView.layer.borderWidth = 2 // as you wish


        let baseUrl2 = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseUrl2 + backdropPath)
        backdropView.af_setImage(withURL: backdropUrl!)
        
        let id = movie["id"] as! Int
        let movie_id = "\(id)"
        //Get JSON data
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie_id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                // TODO: Get the array of movies
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // TODO: Store the trailer url key in a property to use elsewhere
                let result = dataDictionary["results"] as! [[String: Any]]
                let officialTrailer = result[0]
                let key1 = officialTrailer["key"] as! String
                self.key = key1
            }
        }
        task.resume()
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // pass key to trailerviewcontroller
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.key = key
    }
    

}
