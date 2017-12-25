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
        
        MovieAPIManager().superheroMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.collectionView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
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
