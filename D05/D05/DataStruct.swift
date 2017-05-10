//
//  DataStruct.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct Data {
    static var places : [(Artwork)] = [
        (Artwork(title: "Ecole 42", locationName: "42born2code", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8965812, longitude: 2.3161873), color: UIColor.blue)),
        (Artwork(title: "Tour Eiffel", locationName: "Monument", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8583701, longitude: 2.2922926), color: UIColor.red)),
        (Artwork(title: "Musée du Louvre", locationName: "Musée", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8606111, longitude: 2.3354553), color: UIColor.yellow)),
        (Artwork(title: "Notre-Dame de Paris", locationName: "Cathédrale", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8529682, longitude: 2.3477134), color: UIColor.green)),
        (Artwork(title: "Arc de Triomphe", locationName: "Monument", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8737917, longitude: 2.2928388), color: UIColor.orange)),
        (Artwork(title: "Sacré-Cœur", locationName: "Basilique", discipline: "", coordinate: CLLocationCoordinate2D(latitude: 48.8867046, longitude: 2.3409156), color: UIColor.black))
    ]
}
