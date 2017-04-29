//
//  MyString.swift
//  Checklists
//
//  Created by a on 4/23/17.
//  Copyright © 2017 a. All rights reserved.
//

import Foundation
class MyString : NSObject , NSCoding{
   var text = "";
    func encode(with aCoder: NSCoder) {
       
        aCoder.encode(text,forKey :"Text1")
      
    }
    required init?(coder aDecoder: NSCoder) {
      
        text = aDecoder.decodeObject(forKey: "Text1") as! String
       
        super.init()
    }
    override init() {
        super.init()
    }
}
