//
//  ScanResultVC.swift
//  Global Anti-Allergy
//
//  Created by boyuan on 11/9/17.
//  Copyright © 2017 Sarah Pisini. All rights reserved.
//

import UIKit
import CoreLocation

class ScanResultVC: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var theLocation: UILabel!
    
    
    let theManager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations[0]
        CLGeocoder().reverseGeocodeLocation(myLocation) { (placemark, error) in
            if error == nil {
                if let place = placemark?[0]{
                    self.theLocation.text = place.thoroughfare
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theManager.delegate = self
        theManager.requestWhenInUseAuthorization()
        theManager.desiredAccuracy = kCLLocationAccuracyBest
        theManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
