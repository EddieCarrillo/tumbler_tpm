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


class PhotosViewController: UIViewController, UITableViewDataSource {
   
    
    
    
    
    var posts: [[String: Any]] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    
    let feedCellId = "FeedCell"
    
    
    let apiKey: String = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.rowHeight = 240
        refreshData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedCellId, for: indexPath) as! FeedCellTableViewCell
        
        let post = posts[indexPath.row] as! [String: Any]
        
        if let photos = post["photos"] as? [[String: Any]] {
            let photo = photos.first as! [String: Any]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            
            let url = URL(string: urlString)
            
            cell.photoView.af_setImage(withURL: url!)
            
            
        
            
            
        }
        
        
        return cell
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
                
                self.tableview.reloadData()

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

