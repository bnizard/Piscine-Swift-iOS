//
//  SecondViewController.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit
import CoreLocation

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PlaceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setuvarfter loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.places.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PlaceTableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlaceTableViewCell
        cell.place = Data.places[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FirstViewController.initialLocation = CLLocation(latitude: Data.places[indexPath.row].coordinate.latitude, longitude: Data.places[indexPath.row].coordinate.longitude)
        self.tabBarController?.selectedIndex = 0
    }
}
