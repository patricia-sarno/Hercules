//
//  LogViewController.swift
//  Hercules
//
//  Created by Henzon Zambrano on 4/12/21.
//

import UIKit

class LogViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let pullup = PullUpViewController()
    
    let names = [
        "",
        ""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension LogViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped")
    }
}

extension LogViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
}
