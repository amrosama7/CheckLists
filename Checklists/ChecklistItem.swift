//
//  checkList.swift
//  Checklists
//
//  Created by a on 4/19/17.
//  Copyright © 2017 a. All rights reserved.
//

import Foundation
class ChecklistItem : NSObject,NSCoding{
    var text = "";
    var checked = false;
    func encode(with aCoder: NSCoder) {
      
        aCoder.encode(text,forKey :"Text2")
        aCoder.encode(checked,forKey: "Mark")
    }
    required init?(coder aDecoder: NSCoder) {
       
        text = aDecoder.decodeObject(forKey: "Text2") as! String
        checked = aDecoder.decodeBool(forKey: "Mark")
        super.init()
    }
    override init() {
        super.init()
    }
}
