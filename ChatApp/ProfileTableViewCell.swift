//
//  ProfileTableViewCell.swift
//  ChatApp
//
//  Created by Andrew Piterov on 26/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var cellimage: UIImageView!
    @IBOutlet weak var cellname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
