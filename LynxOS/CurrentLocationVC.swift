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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        map.setRegion(region, animated: true)
        
        print(location.altitude, location.course, location.floor ?? "0", location.speed)
        
        self.map.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print("Error")
            } else {
                if let place = placemark?[0] {
                    self.info.text = "\(place.country ?? "X"), \(place.administrativeArea ?? "X"), \(place.thoroughfare ?? "X"), \(place.subThoroughfare ?? "X"), \(place.locality ?? "X")"
                }
            }
        }
    }

}
