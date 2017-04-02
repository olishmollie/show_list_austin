//
//  CurrentShowsTableViewController.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 4/1/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import UIKit

class CurrentShowsTableViewController: UITableViewController {
    
    var client = ShowListClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        client.getCurrentShows(callback: reloadTable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        reloadTable()
        print("Reload button pressed.")
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let shows = client.shows else { return 0 }
        
        return shows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell

        cell.showInfo.text = client.shows?[indexPath.row]

        return cell
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
