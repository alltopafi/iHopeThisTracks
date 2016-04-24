//
//  invoiceHelper.swift
//  iHopeThisTracks
//
//  Created by Hinh, Andrew on 4/24/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation

class invoiceHelper: NSObject {
    
    //properties
    
    var INVOICENUM: String?
    var PARTS: String?
    var PRICE: String?
    var ACCOUNTNAME: String?
    var NOTES: String?
    var ASSIGNED: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(INVOICENUM: String, PARTS: String, PRICE: String, ACCOUNTNAME: String, NOTES: String, ASSIGNED:String) {
        
        self.INVOICENUM = INVOICENUM
        self.PARTS = PARTS
        self.PRICE = PRICE
        self.ACCOUNTNAME = ACCOUNTNAME
        self.NOTES = NOTES
        self.ASSIGNED = ASSIGNED
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "INVOICENUM: \(INVOICENUM), PARTS: \(PARTS), PRICE: \(PRICE), ACCOUNTNAME: \(ACCOUNTNAME), NOTES: \(NOTES), ASSIGNED: \(ASSIGNED)"
        
    }
    
    
}