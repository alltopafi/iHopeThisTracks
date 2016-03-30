//
//  deliveryHelper.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 3/30/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation

class deliveryHelper: NSObject {
    
    //properties
    
    var DRIVERNAME: String?
    var DESTINATION: String?
    var STATUS: Int?
    var NOTE: String?
    var INVOICENUM: Int?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(DRIVERNAME: String, DESTINATION: String, STATUS: Int, NOTE: String, INVOICENUM: Int) {
        
        self.DRIVERNAME = DRIVERNAME
        self.DESTINATION = DESTINATION
        self.STATUS = STATUS
        self.NOTE = NOTE
        self.INVOICENUM = INVOICENUM
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "DRIVERNAME: \(DRIVERNAME), DESTINATION: \(DESTINATION), STATUS: \(STATUS), NOTE: \(NOTE), INVOICENUM: \(INVOICENUM)"
        
    }
    
    
}