//
//  ScratchViewController.swift
//  Facebook
//
//  Created by Olivia Muesse on 9/22/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class ScratchViewController: UIViewController {

    @IBOutlet weak var boxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onIdentityButton(sender: AnyObject) {
        self.boxView.transform = CGAffineTransformIdentity
    }
    
    @IBAction func onRotate(sender: AnyObject) {
        self.boxView.transform = CGAffineTransformMakeRotation(0.5)
    }
    
    @IBAction func onTranslate(sender: AnyObject) {
        self.boxView.transform = CGAffineTransformMakeTranslation(50.0, 0.0)
    }
    
    //@IBAction func onScale(sender: AnyObject) {
        //self.boxView.transform = CGAffineTransformMakeScale(2.0, 0.5)
    //}
    
    //@IBAction func onRotate1(sender: AnyObject) {
        //self.boxView.transform = TransformRotation(self.boxView.transform, 0.5)
    //}

    //@IBAction func onTranslate1(sender: AnyObject) {
        //self.boxView.transform = CGAffineTransformTranslation(50.0, 0.0)
    //}
    
    //@IBAction func onScale1(sender: AnyObject) {
        //self.boxView.transform = CGAffineTransformScale(2.0, 0.5)
   // }
    
    
    
    @IBOutlet weak var onTranslate: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
