//
//  ImageTableViewCell.swift
//  Checklists
//
//  Created by a on 4/29/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
   
    @IBOutlet var ImageButton: UIButton!
    

    @IBOutlet var ImageName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
