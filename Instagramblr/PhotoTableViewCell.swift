//
//  PhotoTableViewCell.swift
//  Instagramblr
//
//  Created by Andrew Montgomery on 8/26/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
