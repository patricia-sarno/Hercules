//
//  PullUpViewController.swift
//  Hercules
//
//  Created by Patricia on 4/12/21.
//

import UIKit

class PullUpViewController: UIViewController {

    @IBOutlet weak var pullUpCount: UILabel!
    
    var counter = 0
    
    @IBAction func pullUpButtonPressed(_ sender: UIButton) {
        counter += 1
        pullUpCount.text = "\(counter)"
    }
}
