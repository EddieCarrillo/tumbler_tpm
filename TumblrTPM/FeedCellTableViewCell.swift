//
//  FeedCellTableViewCell.swift
//  TumblrTPM
//
//  Created by Eduardo Carrillo on 12/27/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
