//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Benny Singer on 11/24/17.
//  Copyright © 2017 bzsinger. All rights reserved.
//

import UIKit
import MBProgressHUD

class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        
        let posterPathString = movie["poster_path"] as? String
        
        if let posterPathString = posterPathString {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let posterURL = URL(string: baseURLString + posterPathString)!
            
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func fetchMovies() {
        
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=" + APIKey)!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        // Asynchronous
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when network request returns
            
            // checks if error nil, if it is, ignore if
            // otherwise, put error into 'error'
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                // because !, will crash if exception thrown
                // cast as dictionary, String: Any
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = dataDictionary["results"] as! [[String: Any]]
                
                // ViewController sets up much faster than network gets back,
                // so reload data once we get it
                self.collectionView.reloadData()
                
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
        
        // to actually start task
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
