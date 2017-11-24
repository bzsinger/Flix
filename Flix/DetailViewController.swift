//
//  DetailViewController.swift
//  Flix
//
//  Created by Benny Singer on 11/23/17.
//  Copyright © 2017 bzsinger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let posterPathString = movie["poster_path"] as! String
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView?.af_setImage(withURL: posterURL)
            
            let backdropPathString = movie["backdrop_path"] as! String
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backdropImageView?.af_setImage(withURL: backdropURL)
        }
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
