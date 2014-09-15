//
//  SignInViewController.swift
//  carousel
//
//  Created by Kunal Kshirsagar on 9/11/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passworldField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signInImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var formView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //handle keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        emailField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSignIn(sender: AnyObject) {
        //check if both email and password are empty
        if(emailField.text.isEmpty && passworldField.text.isEmpty){
            var alertView = UIAlertView(title: "Email & Password Required", message: "Email and Password fields are empty", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        //check if email is empty
        if(emailField.text.isEmpty){
            var alertView = UIAlertView(title: "Email Required", message: "Email Field is empty", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        //check if password is empty
        if(passworldField.text.isEmpty){
            var alertView = UIAlertView(title: "Password Required", message: "Password Field is empty", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        //show signing in alertview
        var alertView = UIAlertView(frame: CGRect(x: 20, y: 150, width: 140, height: 30))
        alertView.title = "Signing In..."
        
        //Show the alert view
        alertView.show()
        
        // Delay for 2 seconds, then check for password
        delay(2) {
        alertView.dismissWithClickedButtonIndex(0, animated: true)
            //check for correct password
        if(!self.checkPassword()){
            var alertView1 = UIAlertView(title: "Invalid Email/Password", message: "Please enter correct email/password", delegate: self, cancelButtonTitle: "OK")
            alertView1.show()
            return
        }
            
            //after successful login - go to tutorial screen
            self.performSegueWithIdentifier("tutorialSegue",sender:self)
            
        }
        
    }
    
    func checkPassword() -> Bool {
        if(emailField.text != "tim" &&  passworldField.text != "yy"){
            return false
        }
        return true
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        if(signInImageView.frame.origin.y >= 380) {
            signInImageView.frame.origin.y = signInImageView.frame.origin.y - 130
        }
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        if(signInImageView.frame.origin.y <= 380) {
            signInImageView.frame.origin.y = signInImageView.frame.origin.y + 130
        }
    }

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
