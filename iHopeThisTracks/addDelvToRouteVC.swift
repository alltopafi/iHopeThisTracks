//
//  addDelvToRouteVC.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/21/16.
//  Copyright © 2016 it391. All rights reserved.
//

//this view needs to populate from the unassigned invoices
//this needs to updated as well it
//need to create another swift file that is similar to deliveryModel
//where we can view all open deliveries, and when a user clicks on them, it will update the invoice
//table, column assigned, as well as create a row in the delivery table for this invoice and driver name

import Foundation
import UIKit

class addDelvToRouteVC: UIViewController, UITableViewDataSource,UITextFieldDelegate, UITableViewDelegate, deliveryModelProtocal
{
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var listTableView: UITableView!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
    @IBAction func setNameButton(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        myDeliveryModel.delegate = self
        myDeliveryModel.downloadItems()
        sleep(1)
        feedItems = myDeliveryModel.getDeliveries()
        //        print(feedItems.count)
        
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCellRoute"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        
        // Get the location to be shown
        let item: deliveryHelper = feedItems[indexPath.row] as! deliveryHelper
        // Get references to labels of cell
        myCell.textLabel!.text = item.DESTINATION
        return myCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        //        print("selected: ",currentCell.textLabel!.text)
        
        for(var i = 0; i<feedItems.count; i++)
        {
            if(feedItems[i].DESTINATION == currentCell.textLabel!.text)
            {
                print("index is at: ",i)
                index = i
                break;
            }
        }
        
        switchScreen();
        
    }
    
    
    func switchScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("myDeliveryViewController") as UIViewController
        
        
        self.presentViewController(vc, animated: true, completion: nil)
    }

    
}