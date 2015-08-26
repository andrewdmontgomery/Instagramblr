//
//  PhotosViewController.swift
//  Instagramblr
//
//  Created by Andrew Montgomery on 8/26/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        var clientId = ""
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as? [NSDictionary]
            
            NSLog("response: \(self.photos)")
            self.tableView.reloadData()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCellReuseID", forIndexPath: indexPath) as! PhotoTableViewCell
        
        let photoInfo = photos![indexPath.row]
        
        let url = NSURL(string: photoInfo.valueForKeyPath("images.low_resolution.url") as! String)!
        cell.photoView.setImageWithURL(url)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let photos = self.photos {
            return photos.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! PhotoDetailsViewController
        
        var indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        
        //vc.selectedPhoto = self.photos

    }
    

}
