//
//  driverMsgVC.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/21/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation
import UIKit


class driverMsgVC: UIViewController, NSURLSessionDataDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var chatField: UITextView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var msgField: UITextField!
    
    var data : NSMutableData = NSMutableData()
    var messages: NSMutableArray = NSMutableArray()
    var printedIndex = 0
    
    let urlPath: String = "http://24.14.58.240/getmessage.php" //this will be changed to the path where service.php lives
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        msgField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func sendButtonClick(sender: AnyObject) {
       
        
        
        let name = nameField.text!
        let msg = msgField.text!
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://24.14.58.240/setmessage.php")!)
        request.HTTPMethod = "POST"
        
        let postString = "a=\(name)&b=\(msg)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
        sleep(1)
        msgField.text = ""
        update()
    }
    
    
    override func viewDidAppear(animated: Bool) {
       print("view appear")
        self.update()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.update()
    }
    
    
    func downloadItems(){
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
    
        task.resume()
        sleep(1)
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            parseJSON()
//            self.getDeliveries()
            print("Data downloaded")
        }
        
    }
    
    
    
   
    
    
    
    func parseJSON() {
        
        debugPrint("parse json called")

        
        var jsonResult: NSDictionary = NSDictionary()
        
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var something: NSMutableArray
        something = jsonResult.mutableArrayValueForKey("object_name")
        let message_id = something.mutableArrayValueForKey("MESSAGE_ID")
        let senderName = something.mutableArrayValueForKey("NAME")
        let text = something.mutableArrayValueForKey("TEXT")
        var msgHelp =  msgObject()

        
        //this was messsages.count
        for(var i = 0;i<something.count;i += 1)
        {
            msgHelp =  msgObject(MESSAGE_ID: message_id[i] as! String,NAME: senderName[i] as! String,TEXT: text[i] as! String)
            
            messages.addObject(msgHelp)
        }
    }
    
    func fillChatWindow()
    {
        for(var i = printedIndex;i<messages.count;i++)
        {
                let curMsg = messages[i] as! msgObject
                chatField.text.appendContentsOf( curMsg.NAME! + ": " + curMsg.TEXT! + "\n\n")
                printedIndex++
        }
    }
    
    func update(){
        data.setData(NSData())
        chatField.text = ""
        downloadItems()
        sleep(1)
        fillChatWindow()
    }
    
    
    
    
    
    
    
}
