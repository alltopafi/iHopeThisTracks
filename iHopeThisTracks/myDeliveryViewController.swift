//
//  myDeliveryViewController.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/20/16.
//  Copyright © 2016 it391. All rights reserved.
//

import UIKit

//var index: Int = 0
//var feedItems: NSArray = NSArray()


class myDeliveryViewController: UIViewController
{
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var invoiceNumberLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        //print(feedItems[index])

        var delivery: deliveryHelper
        delivery = feedItems[index] as! deliveryHelper
        
        destinationLabel.text = delivery.DESTINATION
        statusLabel.text = delivery.STATUS
        noteLabel.text = delivery.NOTE
        invoiceNumberLabel.text = delivery.INVOICENUM
        
        
    }
    
    
    
    
}