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
    @IBOutlet weak var gesture: UILongPressGestureRecognizer!
    
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
    
    @IBAction func addAnnotationTapped(_ sender: Any) {
        handleLongPress(gestureRecognizer: gesture)
    }
    
    // Add annotation when long press
    func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began {
        
        let touchPoint: CGPoint = gestureRecognizer.location(in: map)
        let newCoordinate: CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: map)
        
        addAnnotationOnLocation(pointedCoordinate: newCoordinate)
        }
    }
    
    func addAnnotationOnLocation(pointedCoordinate: CLLocationCoordinate2D) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = pointedCoordinate
        annotation.title = "Loading..."
        annotation.subtitle = "Loading..."
        map.addAnnotation(annotation)
    }


}
