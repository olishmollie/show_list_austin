//
//  ViewController.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 3/9/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showsView: UIView!
    
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
                
                let showInfoDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                
                let shows = showInfoDict["shows"] as! [String]
                let x = 10
                var y = 20
                
                DispatchQueue.main.async() {
                    for show in shows {
                        let dynamicLabel = UILabel(frame: CGRect(x: x, y: y, width: Int(self.view.bounds.width), height: 20))
                        dynamicLabel.textColor = UIColor.black
                        dynamicLabel.textAlignment = NSTextAlignment.left
                        dynamicLabel.text = show
                        
                        self.showsView.addSubview(dynamicLabel)
                        y += 30
                    }
                }
                
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }


}

