//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        feedImageView.alpha = 0
        // Configure the content size of the scroll view
        var defaults = NSUserDefaults.standardUserDefaults()
        /*if defaults.boolForKey("isNewUser") == true {
            feedImageView.image = UIImage(named: "empty_feed")
        }*/
        scrollView.contentSize = feedImageView.image!.size
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        scrollView.insertSubview(refreshControl, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onRefresh() {
        delay(2, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var offset = scrollView.contentOffset.y
        println(scrollView.contentSize.height)
        println(offset)
        if offset >= scrollView.contentSize.height {
            println("did it work?")
            var newImage = UIImageView()
            newImage.image = UIImage (named: "home_feed")
            scrollView.insertSubview(newImage, atIndex: 1)
            newImage.frame.origin.y = scrollView.frame.height
            println(newImage.frame.origin.y)
            //scrollView.contentSize = newImage.image!.size
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
        
        
        delay(2) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
            UIView.animateWithDuration(0.3, animations: {
                self.feedImageView.alpha = 1
            })
        }
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
