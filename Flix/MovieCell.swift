//
//  MovieCell.swift
//  Flix
//
//  Created by Benny Singer on 11/22/17.
//  Copyright © 2017 bzsinger. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    // UITableViewCell already has "imageView" and "label"
    // avoid collisions by not using those variable names
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
