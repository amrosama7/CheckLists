//
//  TableViewCell.swift
//  Checklists
//
//  Created by a on 4/17/17.
//  Copyright © 2017 a. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
 
    @IBOutlet var CheckMArk: UILabel!
    @IBOutlet var  Labeli : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse(){
        Labeli.text = "" ;
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
