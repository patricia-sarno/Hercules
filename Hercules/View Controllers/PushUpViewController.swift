//
//  PushUpViewController.swift
//  Hercules
//
//  Created by Patricia on 4/12/21.
//

import UIKit

class PushUpViewController: UIViewController {

    @IBOutlet weak var pushUpCount: UILabel!
    
    let device = UIDevice.current
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proximitySensor()
    }
    
    func proximitySensor() {
        device.isProximityMonitoringEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximityChanged), name: Notification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: nil)
    }
    
    @objc func proximityChanged(notification: Notification) {
        if let device = notification.object as? UIDevice {
            
            
            
            if device.proximityState {
                counter += 1
                self.pushUpCount.text = "\(counter)"
            }
            
        }
        
        
        
    }

}
