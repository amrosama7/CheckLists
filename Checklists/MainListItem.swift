//
//  MainListItem.swift
//  Checklists
//
//  Created by a on 4/23/17.
//  Copyright © 2017 a. All rights reserved.
//

import Foundation
import UIKit
class MainListItem : NSObject, NSCoding{
    var image:UIImage!
    var text :MyString = MyString()
    var items :ArrayOfCells = ArrayOfCells()
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image,forKey :"Image")
        aCoder.encode(text,forKey :"Text")
        aCoder.encode(items,forKey: "Items")
    }
    required init?(coder aDecoder: NSCoder) {
        image = aDecoder.decodeObject(forKey: "Image") as! UIImage!
        text = aDecoder.decodeObject(forKey: "Text") as! MyString
        items = aDecoder.decodeObject(forKey: "Items") as! ArrayOfCells
        super.init()
    }
    override init() {
        super.init()
    }
}
