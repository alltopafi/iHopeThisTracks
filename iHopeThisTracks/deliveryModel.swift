
//
//  File.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/6/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation

protocol deliveryModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}

class deliveryModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    var deliveries: NSMutableArray = NSMutableArray()

    weak var delegate: deliveryModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://24.14.58.240/getdriver.php" //this will be changed to the path where service.php lives
    //let urlPath: String = "http://10.0.0.5/getdriver.php"
    
    
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
            self.getDeliveries()
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
        let driverNames = something.mutableArrayValueForKey("DRIVERNAME")
        let destinations = something.mutableArrayValueForKey("DESTINATION")
        let status = something.mutableArrayValueForKey("STATUS")
        let note = something.mutableArrayValueForKey("NOTE")
        let invoicenum = something.mutableArrayValueForKey("INVOICENUM")
        
        
        var deliveryHelp =  deliveryHelper()
        
        for(var i = 0;i<something.count;i += 1)
        {
            deliveryHelp =  deliveryHelper(DRIVERNAME: driverNames[i] as! String,DESTINATION:destinations[i] as! String,STATUS: status[i] as! String,NOTE: note[i] as! String,INVOICENUM: invoicenum[i] as! String)

            deliveries.addObject(deliveryHelp)
        
        }
        
        for(var i = 0;i<deliveries.count;i += 1)
        {
            print(deliveries[i])
            print("--------------")

        }
    
    }
    
    func getDeliveries() -> NSMutableArray {
//        print("getDeliveries called")
        return deliveries
    }
    
}
