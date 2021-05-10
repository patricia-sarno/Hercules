//
//  PushUpViewController.swift
//  Hercules
//
//  Created by Patricia on 4/12/21.
//

import UIKit
import FirebaseDatabase

class PushUpViewController: UIViewController {

    @IBOutlet weak var pushUpCount: UILabel!
    
    let device = UIDevice.current
    
    var counter = 0
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proximitySensor()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        ref.childByAutoId().setValue(["WorkoutType":"Push Ups", "Reps": counter])
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
