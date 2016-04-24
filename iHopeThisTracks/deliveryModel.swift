//  File.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/6/16.
//  Copyright © 2016 it391. All rights reserved.
//

//this needs to be changed
//needs to grab open invoices instead of deliveries


import Foundation

protocol deliveryModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}

class deliveryModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    //ah
//    var deliveries: NSMutableArray = NSMutableArray()
    var invoices: NSMutableArray = NSMutableArray()

    weak var delegate: deliveryModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    //this address when need to point to a php file where it gets all invoice where drivername == the name in the text field 
    //ah
//    let urlPath: String = "http://24.14.58.240/getdriver.php" //this will be changed to the path where service.php lives
    //let urlPath: String = "http://10.0.0.5/getdriver.php"
    let urlPath: String = "http://24.14.58.240/getinvoice.php"
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            self.parseJSON()
            //ah
//            self.getDeliveries()
            self.getInvoices()
            print("Data downloaded")
        }
        
    }
    

    
    func parseJSON() {
        
        var jsonResult: NSDictionary = NSDictionary()

        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
        } catch let error as NSError {
            print(error)
            
        }
        
        
        let something: NSMutableArray
        something = jsonResult.mutableArrayValueForKey("object_name")
        //ah
//        let driverNames = something.mutableArrayValueForKey("DRIVERNAME")
//        let destinations = something.mutableArrayValueForKey("DESTINATION")
//        let status = something.mutableArrayValueForKey("STATUS")
//        let note = something.mutableArrayValueForKey("NOTE")
//        let invoicenum = something.mutableArrayValueForKey("INVOICENUM")

        let invoiceNums = something.mutableArrayValueForKey("INVOICENUM")
        let parts = something.mutableArrayValueForKey("PARTS")
        let price = something.mutableArrayValueForKey("PRICE")
        let accountNames = something.mutableArrayValueForKey("ACCOUNTNAME")
        let notes = something.mutableArrayValueForKey("NOTES")
        let assigned = something.mutableArrayValueForKey("ASSIGNED")
        
        
        //ah
//        var deliveryHelp =  deliveryHelper()
//        
//        for(var i = 0;i<something.count;i += 1)
//        {
//            deliveryHelp =  deliveryHelper(DRIVERNAME: driverNames[i] as! String,DESTINATION:destinations[i] as! String,STATUS: status[i] as! String,NOTE: note[i] as! String,INVOICENUM: invoicenum[i] as! String)
//
//            deliveries.addObject(deliveryHelp)
//        
//        }
        var invoiceHelp = invoiceHelper()
        
        for(var i = 0; i < something.count; i+=1)
        {
            invoiceHelp = invoiceHelper(INVOICENUM: invoiceNums[i] as! String, PARTS: parts[i] as! String, PRICE: price[i] as! String, ACCOUNTNAME: accountNames[i] as! String, NOTES: notes[i] as! String, ASSIGNED: assigned[i] as! String)
            
            invoices.addObject(invoiceHelp)
        }
    }
    
//    func getDeliveries() -> NSMutableArray {
//        return deliveries
//    }
    func getInvoices() -> NSMutableArray
    {
        return invoices
    }
    
}
