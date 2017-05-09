//
//  SecondViewController.swift
//  D03
//
//  Created by Bastien NIZARD on 10/7/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    var photo: UIImage?
    var image: UIImageView?
    var imageInit: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImageView(image: photo)
        ScrollView.addSubview(image!)
        ScrollView.contentSize = (image?.frame.size)!
        imageInit = (image?.frame.size.width)!
        ScrollView.maximumZoomScale = 100
        ScrollView.minimumZoomScale = UIScreen.main.bounds.width / (image?.frame.size.width)!
        ScrollView.setZoomScale(ScrollView.minimumZoomScale, animated: false)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        ScrollView.minimumZoomScale = size.width / imageInit
        ScrollView.setZoomScale(ScrollView.minimumZoomScale, animated: true)
    }
}
