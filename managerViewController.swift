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
        let initialLocation = CLLocation(latitude: 40.4972157, longitude: -88.9947266)
        
        var anotation = MKPointAnnotation()
        var latitude:Double = 40.4972157
        var longitude:Double = -88.9947266
        
        anotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        anotation.title="Current Location 1"
        anotation.subtitle="Driver 1"
        
        //add pin with annotation
        mapView.addAnnotation(anotation)
        
        var anotation2 = MKPointAnnotation()
        
        anotation2.coordinate = CLLocationCoordinate2D(latitude: 40.49, longitude: -88.99)
        anotation2.title="Driver Destination"
        anotation2.subtitle="Driver 2"
        
        //add pin with annotation
        mapView.addAnnotation(anotation2)
        
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

