//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Benny Singer on 11/22/17.
//  Copyright © 2017 bzsinger. All rights reserved.
//

import UIKit
import AlamofireImage
import PKHUD

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [[String: Any]] = []
    
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
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        PKHUD.sharedHUD.show()
        
        fetchMovies()
    }
    
    func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies(pullToRefresh: true)
    }
    
    func fetchMovies(pullToRefresh: Bool = false) {
        
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
                self.tableView.reloadData()
                
                if pullToRefresh {
                    // tell refreshControl to stop refreshing
                    self.refreshControl.endRefreshing()
                } else {
                    PKHUD.sharedHUD.hide(afterDelay: 1)
                }
            }
        }
        
        // to actually start task
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie["title"] as? String
        cell.titleLabel.sizeToFit()
        
        cell.overviewLabel.text = movie["overview"] as? String
        cell.overviewLabel.sizeToFit()
        
        let posterPathString = movie["poster_path"] as! String
        
        // alternatively can do a call to configuration to get all information
        // https://developers.themoviedb.org/3/configuration/get-api-configuration
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        
        let posterURL = URL(string: baseURLString + posterPathString)!
        
        cell.posterImageView?.af_setImage(withURL: posterURL)
        
        return cell
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
