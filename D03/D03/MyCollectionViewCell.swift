//
//  MyCollectionViewCell.swift
//  D03
//
//  Created by Bastien NIZARD on 10/6/16.
//  Copyright © 2016 Bastien NIZARD. All rights reserved.
//
import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var Activity: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    static var dicImage : [String : UIImage] = [:]

    var image : (String)?{
        didSet{
        let qos = DispatchQoS.QoSClass.background
        let queue = DispatchQueue.global(qos: qos)
            queue.async{
                if let url = self.image{
                    if MyCollectionViewCell.dicImage[url] == nil{
                         _ = (UIApplication.shared.delegate as! AppDelegate).setNetworkActivityIndicatorVisible(true)
                        self.Activity.startAnimating()
                        if let surl = URL(string: url) {
                            if let data = try? Foundation.Data(contentsOf: surl) {
                                DispatchQueue.main.async{
                                    self.Activity.isHidden = true
                                    self.imageView.image = UIImage(data: data)
                                    MyCollectionViewCell.dicImage[url] = self.imageView.image
                                    _ = (UIApplication.shared.delegate as! AppDelegate).setNetworkActivityIndicatorVisible(false)
                                }
                            }
                            else
                            {
                                
                                DispatchQueue.main.async(execute: {
                                                self.Activity.stopAnimating()
                                                (UIApplication.shared.delegate as! AppDelegate).setNetworkActivityIndicatorVisible(false)
                                                let refreshAlert = UIAlertController(title: "Error", message: "Cannot acces to " + url, preferredStyle: UIAlertControllerStyle.alert)
                                                
                                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                                                }))
                                                UIApplication.shared.keyWindow?.rootViewController?.present(refreshAlert, animated: true, completion: nil)
                                                self.Activity.isHidden = true
                                });
                            }
                        }
                    }
                    else
                    {
                        self.imageView.image = MyCollectionViewCell.dicImage[url]
                    }
                }
            }
        }
    }
}
