//
//  GroupListViewController.swift
//  ChatterBot
//
//  Created by Chris Mousdale on 27/02/2017.
//  Copyright © 2017 Chris Mousdale. All rights reserved.
//

import UIKit
import SendBirdSDK

class GroupListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var groupTableView: UITableView!
    
    private var channels: [SBDOpenChannel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createOpenChannel()
    }
    
    func createOpenChannel() {
        let query = SBDOpenChannel.createOpenChannelListQuery()
        query?.limit = 100
        
        query?.loadNextPage(completionHandler: {[unowned self]
            (channels, error) in
            if error != nil {
                NSLog("Error: %@", error!)
                return
            }
            
            for channel in channels! {
                self.channels.append(channel)
            }
            
            DispatchQueue.main.async {
                self.groupTableView.reloadData()
            }
            // ...
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This will be the number of rows returned in the query.
        return self.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        
        (cell as! groupCell).setCellInfo(aChannel: self.channels[indexPath.row])
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return messages.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
//        cell.textLabel?.text = messages[indexPath.row]
//        return cell
//    }
//    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "groupDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! GroupDetailViewController
        destination.testString = "Test Data"
    }

}
