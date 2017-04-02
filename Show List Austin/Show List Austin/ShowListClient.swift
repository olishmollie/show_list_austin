//
//  ShowListClient.swift
//  Show List Austin
//
//  Created by Oliver Duncan on 4/1/17.
//  Copyright © 2017 BondTwins. All rights reserved.
//

import Foundation

class ShowListClient {
    
    let url = URL(string: "http://localhost:3000/shows/today")
    var shows: [String]?
    
    func getCurrentShows(callback: @escaping () -> Void) {
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                
                let showInfoDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                
                self.shows = showInfoDict["shows"] as? [String]
                
                callback()
                
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }
    

}
