//
//  addInvoiceViewController.swift
//  iHopeThisTracks
//
//  Created by Jesse Alltop on 4/20/16.
//  Copyright © 2016 it391. All rights reserved.
//

import Foundation
import UIKit

class addInvoiceViewController: UIViewController
{
    
    @IBOutlet weak var invoiceNumLabel: UITextField!//int
    @IBOutlet weak var partsLabel: UITextField!//string
    @IBOutlet weak var priceLabel: UITextField!//double
    @IBOutlet weak var accountLabel: UITextField!//varchar
    @IBOutlet weak var notesLabel: UITextField!//varchar
   
    @IBAction func submitButton(sender: AnyObject) {
    
        let price = Double(priceLabel.text!)
        let priceRound = Double(round(1000*price!)/1000)
        let invoiceNum = Int(invoiceNumLabel.text!)
        print(priceRound)
                print("button hit")
                let request = NSMutableURLRequest(URL: NSURL(string: "http://24.14.58.240/setinvoice.php")!)
                request.HTTPMethod = "POST"
                let postString = "a=\(invoiceNum)&b=\(partsLabel.text!)&c=\(priceRound)&d=\(accountLabel.text!)&e=\(notesLabel.text!)"
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
        print("add invoice contoller loaded")
        
        
        
        
        
    }

}