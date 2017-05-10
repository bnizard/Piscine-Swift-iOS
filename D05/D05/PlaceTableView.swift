//
//  PlaceTableView.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit

class PlaceTableView: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.Places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = PlaceTableView.dequeueReusableCellWithIdentifier("PlaceCell") as! PlaceTableViewCell
        cell.tweet = PlaceTableView[indexPath.row]
        return cell

    }
}
