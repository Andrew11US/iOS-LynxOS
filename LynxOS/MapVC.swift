//
//  MapVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/28/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.76, -122.34)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Apple"
        annotation.subtitle = "Welcome"
        
        map.addAnnotation(annotation)
    }


}
