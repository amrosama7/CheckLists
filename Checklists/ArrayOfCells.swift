//
//  ArrayOfCells.swift
//  Checklists
//
//  Created by a on 4/23/17.
//  Copyright © 2017 a. All rights reserved.
//

import Foundation
class ArrayOfCells : NSObject , NSCoding{
    var items:[ChecklistItem] = [ChecklistItem]()
    func encode(with aCoder: NSCoder) {
       
        aCoder.encode(items,forKey: "Items1")
    }
    required init?(coder aDecoder: NSCoder) {
        
        items = aDecoder.decodeObject(forKey: "Items1") as! [ChecklistItem]
        super.init()
    }
    override init() {
        super.init()
    }
}
