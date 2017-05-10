//
//  PlaceViewCell.swift
//  D05
//
//  Created by Bastien NIZARD on 10/10/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    
    var place : Artwork? {
        didSet{
            if let p = place {
               NameLabel?.text = String(p.title!)
            }
        }
    }
}