//
//  msgObject.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/21/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation

class msgObject: NSObject {
    
    var MESSAGE_ID: String?
    var NAME: String?
    var TEXT: String?
    
    override init()
    {
        
    }
    
    init(MESSAGE_ID: String, NAME: String, TEXT: String) {
        
        self.MESSAGE_ID = MESSAGE_ID
        self.NAME = NAME
        self.TEXT = TEXT
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "MESSAGE_ID: \(MESSAGE_ID), NAME: \(NAME), TEXT: \(TEXT)"
        
    }
    
    
    
    
}