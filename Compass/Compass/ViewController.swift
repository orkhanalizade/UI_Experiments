//
//  ViewController.swift
//  Compass
//
//  Created by Orkhan Alizada on 19.08.17.
//  Copyright © 2017 Orkhan Alizada. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var compassHead: UIImageView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        UIView.animate(withDuration: 0.4) {
            let rotateAngle = Double(newHeading.magneticHeading) * Double.pi / 180.0
            self.compassHead.transform = CGAffineTransform(rotationAngle: CGFloat(rotateAngle))
        }
    }
}

