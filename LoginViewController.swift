//
//  LoginViewController.swift
//  Facebook
//
//  Created by Olivia Muesse on 9/17/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.enabled = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onLoginButton(sender: UIButton) {
        
        loadingActivityView.startAnimating()
        loginButton.selected = true
        var defaults = NSUserDefaults.standardUserDefaults()
        
        delay(2, closure: { () -> () in
            self.loadingActivityView.stopAnimating()
            self.loginButton.selected = false
            
            if (self.emailTextField.text == "olivia") && (self.passwordTextField.text == "password") {
                defaults.setBool(false, forKey: "isNewUser")
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else if (self.emailTextField.text == "newuser") && (self.passwordTextField.text == "password") {
                self.performSegueWithIdentifier("loginSegue", sender: self)
                defaults.setBool(true, forKey: "isNewUser")
                defaults.synchronize()
            } else {
                UIAlertView(title: "Oh no!", message: "User name and/or password is incorrect", delegate: nil, cancelButtonTitle: "Try again").show()
            }
        })
    }
    
    func emailPasswordCheck() {
        if (self.emailTextField.text == "") || (self.passwordTextField.text == "") {
            self.loginButton.enabled = false
        } else {
            self.loginButton.enabled = true
        }
    }
    
    @IBAction func onEmailText(sender: AnyObject) {
        emailPasswordCheck()
    }
    
    @IBAction func onPasswordText(sender: AnyObject) {
        emailPasswordCheck()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
