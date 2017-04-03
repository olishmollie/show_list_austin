//
//  CurrentShowsTableViewController.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 4/1/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import UIKit

class CurrentShowsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var client = ShowListClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        client.getCurrentShows(callback: reloadTable)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationItem
        let navBar = self.navigationController!.navigationBar
        let imgView = UIImageView(image: UIImage(named: "showlistaustin_logo"))
        
        // TODO: - Scale down image width
        navBar.backgroundColor = .yellow
        nav.titleView = imgView
        imgView.frame = CGRect(x: 0, y: 0, width: 0, height: navBar.bounds.height * 0.8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let shows = client.shows else { return 0 }
        
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
