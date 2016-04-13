
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
    
    weak var delegate: deliveryModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://24.14.58.240/getdriver.php" //this will be changed to the path where service.php lives
    
    
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
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        var jsonResult: NSDictionary = NSDictionary()
        
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            

//            print(jsonResult)

        } catch let error as NSError {
            print(error)
            
        }
        
        
        let dataDictionary = jsonResult["object_name"] //as! NSDictionary
//        print(dataDictionary)
//        let name = dataDictionary!["DRIVERNAME"]
//        print("name is")
//        print(name)
        
        let something: NSMutableArray
        something = jsonResult.mutableArrayValueForKey("object_name")
        let driverNames = something.mutableArrayValueForKey("DRIVERNAME")
        for(var i = 0;i<something.count;i++){
        print(something[i])
        }
        
        
//        var jsonElement: NSDictionary = NSDictionary()
//        let deliveries: NSMutableArray = NSMutableArray()
//        //print(jsonResult)
//        for(var i = 0; i < jsonResult.count; i = i+1)
//        {
//            
//            jsonElement = jsonResult as! NSDictionary
//            
//            let myDelivery = deliveryHelper()
//            
//            print(jsonElement["DRIVERNAME"])
//            //the following insures none of the JsonElement values are nil through optional binding
//            if let DRIVERNAME = jsonElement["DRIVERNAME"] as? String,
//                let DESTINATION = jsonElement["DESTINATION"] as? String,
//                let STATUS = jsonElement["STATUS"] as? Int,
//                let NOTE = jsonElement["NOTE"] as? String,
//                let INVOICENUM = jsonElement["INVOICENUM"] as? Int
//            {
//                myDelivery.DRIVERNAME = DRIVERNAME
//                myDelivery.DESTINATION = DESTINATION
//                myDelivery.STATUS = STATUS
//                myDelivery.NOTE = NOTE
//                myDelivery.INVOICENUM = INVOICENUM
//
//            }
//            
//            deliveries.addObject(myDelivery)
//            
//        }
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            
//            self.delegate.itemsDownloaded(deliveries)
//            
//        })
    }
}