//
//  ViewController.swift
//  D03
//
//  Created by Bastien NIZARD on 10/6/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath) as! MyCollectionViewCell
        cell.image = Data.img[indexPath.row]
        return cell
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Zoom" {
            if let indexPath = collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                let controller = segue.destination as! SecondViewController
                let url = Data.img[indexPath.item]
                controller.photo = MyCollectionViewCell.dicImage[url]
            }
        }
    }
}

