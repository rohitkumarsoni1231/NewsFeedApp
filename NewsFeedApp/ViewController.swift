//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by Rohit Kumar on 8/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var hours: [String] = []
    var FeedData : [FeedData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hours = generateHourList()
        tableView.dataSource = self
    }
    
    func generateHourList() -> [String] {
        var hours: [String] = []
        for hour in 1...12 {
            let amHour = "\(hour) am"
            hours.append(amHour)
            if hour != 12 {
                hours.append("   ")
            }
        }
        for hour in 1...12 {
            let pmHour = "\(hour) pm"
            hours.append(pmHour)
            if hour != 12 {
                hours.append("   ")
            }
        }
        return hours
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourCell", for: indexPath)
        let hour = hours[indexPath.row]
        cell.textLabel?.text = hour
        return cell
        
    }
}
