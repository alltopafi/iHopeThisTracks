//
//  routeViewController.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 3/30/16.
//  Copyright © 2016 it391. All rights reserved.
//
import UIKit


var feedItems: NSArray = NSArray()
var index: Int = 0
var selectedLocation : deliveryHelper = deliveryHelper()
let myDeliveryModel = deliveryModel()


class routeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, deliveryModelProtocal  {
    
    
    //Properties
    
    

    @IBOutlet weak var listTableView: UITableView!
    
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
        let cellIdentifier: String = "BasicCell"
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

