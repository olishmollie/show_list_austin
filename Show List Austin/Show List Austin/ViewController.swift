//
//  ViewController.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 3/9/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getShowInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getShowInfo() {
        let url = URL(string: "http://localhost:3000/shows/today")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                var text: String;
                
                let showInfoDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                
                let shows = showInfoDict["shows"] as! [String]
                
                text = shows.joined(separator: "\n")
                
                DispatchQueue.main.async() {
                    self.showInfo.text = text
                }
                
                
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }


}

