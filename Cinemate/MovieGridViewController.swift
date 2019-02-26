//
//  MovieGridViewController.swift
//  Cinemate
//
//  Created by Kunal Agarwal on 19/02/19.
//  Copyright © 2019 Kunal. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       collectionView.dataSource = self
       collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        
        
        //Get JSON data
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // TODO: Get the array of movies
                
                // TODO: Store the movies in a property to use elsewhere
                self.movies = dataDictionary["results"] as! [[String: Any]]
                // TODO: Reload your table view data
              self.collectionView.reloadData()
          //   print("loaded")
                
                
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return movies.count
    }
   /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        let data = try? Data(contentsOf: posterUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        let img = UIImage(data: data!)
        let heightInPoints = img!.size.height
        let heightInPixels = heightInPoints * (img?.scale)!
        
        let widthInPoints = img!.size.width
        let widthInPixels = widthInPoints * (img?.scale)!
        print("\(widthInPixels) a  \(heightInPixels)")
        return CGSize(width: widthInPixels, height: heightInPixels)
    }*/
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]

        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Find selected movie
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        //push to details view controller
        let detailsViewController = segue.destination as! GridDetailsViewController
        detailsViewController.movie = movie
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    

}
