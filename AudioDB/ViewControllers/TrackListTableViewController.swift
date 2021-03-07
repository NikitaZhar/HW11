//
//  TrackListTableViewController.swift
//  AudioDB
//
//  Created by Nikita Zharinov on 07/03/2021.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
    var trackList: Loved!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 66
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.loved?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! ConfigureCell
        let track = trackList.loved![indexPath.row]
        cell.configure(with: track)
        return cell
    }
}

extension TrackListTableViewController {
    func successAlert() {
        let alert = UIAlertController(title: "Success",
                                      message: "You can see the results in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func failedAlert() {
        let alert = UIAlertController(title: "Failed",
                                      message: "You can see error in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
