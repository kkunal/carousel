//
//  CreateDropboxViewController.swift
//  carousel
//
//  Created by Kunal Kshirsagar on 9/13/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class CreateDropboxViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var checkboxButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize (width:320, height: 500)
        
        //handle keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onCheck(sender: AnyObject) {
        checkboxButton.selected = !checkboxButton.selected
    }

    @IBAction func onCreate(sender: AnyObject) {
        //if user has not checked on the terms of service
        if(!checkboxButton.selected){
            var alertView = UIAlertView(title: "Agree to Terms", message: "You have to agree to terms to create a Dropbox account", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        //if email and password are empty
        if(emailField.text.isEmpty || passwordField.text.isEmpty){
            var alertView = UIAlertView(title: "Email & Password Required", message: "You must enter valid email address and password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        //otherwise show 'creating account dialog'
        //show signing in alertview
        var alertView = UIAlertView(frame: CGRect(x: 20, y: 150, width: 140, height: 30))
        alertView.title = "Creating Dropbox Account..."
        
        //Show the alert view
        alertView.show()
        
        delay(2){
            alertView.dismissWithClickedButtonIndex(0, animated: true)
            //after successful login - go to tutorial screen
            self.performSegueWithIdentifier("tutorialSegue",sender:self)
        }
    }
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        if(scrollView.frame.origin.y == 65) {
            scrollView.frame.origin.y = scrollView.frame.origin.y - 75
        }
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        if(scrollView.frame.origin.y < 65) {
            scrollView.frame.origin.y = scrollView.frame.origin.y + 75
        }
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
