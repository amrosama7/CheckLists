//
//  MainTableViewCell.swift
//  Checklists
//
//  Created by a on 4/23/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var ImageButton: UIButton!
    @IBOutlet var Label: UILabel!
     
    @IBOutlet var NumberOfItems: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse(){
        Label.text = "" ;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
