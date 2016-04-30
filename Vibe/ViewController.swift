//
//  ViewController.swift
//  Vibe_LAHack
//
//  Created by ERIC on 4/30/16.
//  Copyright © 2016 Eric Hu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var myPosition = CLLocationCoordinate2D()
    //var spreadButton: SpreadButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        updateViewSize()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //runWithSwiftCode()
        
        
    }
    
    func updateViewSize(){
        mapView.frame = self.view.frame
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("Latitude: \(newLocation.coordinate.latitude), Longitude: \(newLocation.coordinate.longitude)")
        myPosition = newLocation.coordinate
        
        
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(newLocation.coordinate, span)
        mapView.setRegion(region, animated: true)
        //locationManager.stopUpdatingLocation()
        
    }
    
    
    
    
    
    
}