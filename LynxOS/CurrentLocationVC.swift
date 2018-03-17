//
//  CurrentLocationVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 7/2/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CurrentLocationVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var info: UILabel!
    
    let manager = CLLocationManager()
    var globalLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateLocationWhenNeeded(location: globalLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        globalLocation = locations[0]
        
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
//        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
//        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
//        map.setRegion(region, animated: true)
        
        print(location.altitude, location.course, location.floor ?? "0", location.speed)
        
        self.map.showsUserLocation = true
        
        // Decode user location and read data
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            
            guard error == nil else {
                
                print("Error occured!")
                return
            }
            
            if let place = placemark?[0] {
                self.info.text = "\(place.country ?? "X"), \(place.administrativeArea ?? "X"), \(place.thoroughfare ?? "X"), \(place.subThoroughfare ?? "X"), \(place.locality ?? "X")"
            }
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
        updateLocationWhenNeeded(location: globalLocation)
    }
    
    func updateLocationWhenNeeded(location: CLLocation?) {
        
        guard let location = location else {
            print("Location is empty!")
            return
        }
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        map.setRegion(region, animated: true)
    }
    

}
