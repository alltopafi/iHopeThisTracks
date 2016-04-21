//
//  messagesViewController.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/20/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation
import UIKit

class messagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var msgItems: NSArray = NSArray()

    @IBOutlet weak var chatBox: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var listTableView: UITableView!

    @IBAction func sendMsg(sender: AnyObject) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://24.14.58.240/setmessage.php")!)
        request.HTTPMethod = "POST"
        
        let postString = "a=\(nameField.text)&b=\(messageField.text!)"
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
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        sleep(1)
        
        msgItems = myDeliveryModel.getDeliveries()

        
        
    }
    
    
    
    func itemsDownloaded(items: NSArray) {
        msgItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return msgItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCellMsg"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        
        //let item: deliveryHelper = msgItems[indexPath.row] as! deliveryHelper
        //myCell.textLabel!.text = item.DESTINATION
        return myCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        
        
        
    }
    
    
    
    
    
    
    
}