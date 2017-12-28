//
//  PhotosViewController.swift
//  TumblrTPM
//
//  Created by Eduardo Carrillo on 12/27/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

//
//  PhotosViewController.swift
//
//
//  Created by Eduardo Carrillo on 12/27/17.
//

import UIKit


class PhotosViewController: UIViewController {
    
    
    
    var posts: [[String: Any]] = []
    
    let apiKey: String = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        
    }
    
    
    
    func refreshData(){
        let urlString = "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Bad URL")
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil
        , delegateQueue: OperationQueue.main)
        
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
     let task =   session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let response = dataDictionary["response"] as! [String: Any]
                self.posts = response["posts"] as! [[String: Any]]
                print(self.posts)

            }
        }
        
        
        task.resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

