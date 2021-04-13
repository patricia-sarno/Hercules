//
//  SitUpViewController.swift
//  Hercules
//
//  Created by Patricia on 4/12/21.
//

import UIKit
import CoreMotion

class SitUpViewController: UIViewController {

    @IBOutlet weak var sitUpCount: UILabel!
    
    let motionManager = CMMotionManager()
    
    var counter = 0
    var tempCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGyro()

    }
    
    func myGyro() {
        if motionManager.isGyroAvailable {
            motionManager.deviceMotionUpdateInterval = 1;
            motionManager.startDeviceMotionUpdates()

            motionManager.gyroUpdateInterval = 0.3
            guard let currentQueue = OperationQueue.current else { return }
            motionManager.startGyroUpdates(to: currentQueue) { (gyroData, error) in

                // Do Something, call function, etc
                if let rotation = gyroData?.rotationRate {
                    if rotation.x < -2 {
                        //print ("\(rotation.x)")
                        self.tempCounter += 1
                        if self.tempCounter > 0 {
                            self.counter += 1
                            self.tempCounter = 0
                        }
                        self.sitUpCount.text = "\(self.counter)"
                    
                    }
                    
                    
                }
            }
        }
    }

}
