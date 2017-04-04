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
        client.getCurrentShows(completionHandler: reloadTable)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let navBar = navigationController!.navigationBar
        let imgView = UIImageView(image: UIImage(named: "showlistaustin_logo"))
        
        // TODO: - Scale image width
        imgView.frame.size = CGSize(width: navBar.frame.width, height: navBar.frame.height)
        navigationItem.titleView = imgView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadTable(shows: [String]) {
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
