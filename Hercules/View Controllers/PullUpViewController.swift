//
//  PullUpViewController.swift
//  Hercules
//
//  Created by Patricia on 4/12/21.
//

import UIKit
import FirebaseDatabase

class PullUpViewController: UIViewController {

    @IBOutlet weak var pullUpCount: UILabel!
    
    var counter = 0
    
    let ref = Database.database().reference()
    
    @IBAction func pullUpButtonPressed(_ sender: UIButton) {
        counter += 1
        pullUpCount.text = "\(counter)"
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        ref.childByAutoId().setValue(["WorkoutType":"Pull ups", "Reps": counter])
    }
}
