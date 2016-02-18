//
//  ViewController.swift
//  mapTest
//
//  Created by Jesse Alltop on 2/18/16.
//  Copyright © 2016 Jesse Alltop. All rights reserved.
//

import UIKit
import MapKit

class managerViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let initialLocation = CLLocation(latitude: 40.4972157, longitude: -88.9947266)
        
        centerMapOnLocation(initialLocation)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.5, regionRadius * 2.5)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}

