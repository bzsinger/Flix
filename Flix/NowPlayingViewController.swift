//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Benny Singer on 11/22/17.
//  Copyright © 2017 bzsinger. All rights reserved.
//

import UIKit
import AlamofireImage
import MBProgressHUD

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        tableView.dataSource = self
        // set up cells to automatically resize
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 180
        
        //add refreshControl at top
        tableView.insertSubview(refreshControl, at: 0)
        
        fetchMovies()
    
    }
    
    func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies(pullToRefresh: true)
    }
    
    func fetchMovies(pullToRefresh: Bool = false) {
        
        if !pullToRefresh {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        MovieAPIManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                if pullToRefresh {
                    // tell refreshControl to stop refreshing
                    self.refreshControl.endRefreshing()
                } else {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.titleLabel.sizeToFit()
        
        cell.overviewLabel.text = movie.overview
        cell.overviewLabel.sizeToFit()
        
        cell.posterImageView?.af_setImage(withURL: movie.posterURL!)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! DetailViewController
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            destinationViewController.movie = movies[indexPath.row]
        }
        
        tableView.deselectRow(at: indexPath!, animated: true)
    }

}
