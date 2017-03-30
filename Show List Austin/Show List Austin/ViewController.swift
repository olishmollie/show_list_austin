//
//  ViewController.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 3/9/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var showsView: UIView!
    @IBOutlet weak var spinningWheel: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getShowInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func getTodaysShows(_ sender: Any) {
        getShowInfo()
    }
    
    func getShowInfo() {
        showsView.subviews.forEach({ $0.removeFromSuperview() })
        
        spinningWheel.hidesWhenStopped = true
        spinningWheel.startAnimating()
        
        let url = URL(string: "http://localhost:3000/shows/today")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                
                let showInfoDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                
                let shows = showInfoDict["shows"] as! [String]
                let x = 0.0
                var y = 0.0
                
                DispatchQueue.main.async() {
                    for show in shows {
                        let dynamicLabel = UILabel(frame: CGRect(x: x, y: y, width: Double(self.showsView.frame.width), height: 21.0))
                            
                        dynamicLabel.textColor = UIColor.black
                        dynamicLabel.textAlignment = NSTextAlignment.center
                        dynamicLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
                        dynamicLabel.numberOfLines = 0
                        dynamicLabel.text = show
                        dynamicLabel.sizeToFit()
                        
                        self.showsView.addSubview(dynamicLabel)
                        
                        y += Double(dynamicLabel.frame.height) + 10.0
                    }
                    self.spinningWheel.stopAnimating()
                }
                
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }


}

