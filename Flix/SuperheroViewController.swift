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
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine: CGFloat = 2
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let cellWidth = (collectionView.frame.size.width - interItemSpacingTotal) / cellsPerLine
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 3 / 2)
        
        fetchMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        
        cell.posterImageView.af_setImage(withURL: movie.posterURL)
        return cell
    }
    
    func fetchMovies() {
        
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/141052/similar?api_key=" + APIKey)!
        
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
                self.movies = Movie.movies(dictionaries: dataDictionary["results"] as! [[String: Any]])
                
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! DetailViewController
        
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            destinationViewController.movie = movies[indexPath.row]
        }
    }

}
