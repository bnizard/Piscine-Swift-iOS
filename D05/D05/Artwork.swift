//
//  Artwork.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import MapKit
import Foundation

class Artwork: NSObject, MKAnnotation{
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let color : UIColor
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, color: UIColor) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.color = color
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}