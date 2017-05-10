//
//  FirstViewController.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var isActive: Bool = true
    
    static var initialLocation = CLLocation(latitude: Data.places[0].coordinate.latitude, longitude: Data.places[0].coordinate.longitude)
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPinForData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centerMapOnLocation(FirstViewController.initialLocation)
    }
    
    @IBAction func GeolocateButton(_ sender: AnyObject) {
        if (isActive)
        {
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
            MapView.showsUserLocation = true
        }
        else {
            locationManager.stopUpdatingLocation()
            MapView.showsUserLocation = false
        }
        isActive = !isActive
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        centerMapOnLocation(CLLocation(latitude: locValue.latitude, longitude: locValue.longitude))
    }
    
    @IBAction func SegControlButton(_ sender: AnyObject) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            MapView.mapType = .standard
        case 1:
            MapView.mapType = .satellite
        default: // or case 2
            MapView.mapType = .hybrid
        }
    }
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        MapView.setRegion(coordinateRegion, animated: true)
    }
    
    func createPinForData()
    {
        for (_,value) in Data.places.enumerated() {
           MapView.addAnnotation(value)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        let identifier = ""
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            let anno = annotation as? Artwork
            annotationView?.pinTintColor = anno?.color
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}

