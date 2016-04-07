//
//  routeViewController.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 3/30/16.
//  Copyright © 2016 it391. All rights reserved.
//
import UIKit

class routeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, deliveryModelProtocal  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : deliveryHelper = deliveryHelper()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let myDeliveryModel = deliveryModel()
        myDeliveryModel.delegate = self
        myDeliveryModel.downloadItems()
        
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
        print(item.DESTINATION)
        print("test")
        return myCell
    }
    
}

