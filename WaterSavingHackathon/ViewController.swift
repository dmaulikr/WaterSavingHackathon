//
//  ViewController.swift
//  WaterSavingHackathon
//
//  Created by ShowalterS18 on 1/30/16.
//  Copyright © 2016 Sam Showalter. All rights reserved.
//

import UIKit
import Parse
import FBSDKLoginKit
import FBSDKCoreKit
import ParseFacebookUtilsV4
//import Data

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        faebookLogin()
        //createUser()
        print("hi")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //from facebok docs
    func faebookLogin() {
        var loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view!.addSubview(loginButton)
      //  FBSDKButton.load()
        
    }
    //parse user
    func createUser() {
        let user = PFUser()
        user.username = "my name"
        user.password = "my pass"
        user.email = "lololol@example.com"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
        
    }
    
    func _loginWithFacebook() {
        // Set permissions required from the facebook user account
        var permissionsArray: [AnyObject] = ["user_about_me", "user_relationships", "user_birthday", "user_location"]
        // Login PFUser using Facebook
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissionsArray, block: {(user: PFUser, error: NSError) -> Void in
            if !user {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            }
            else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
            }
            else {
                NSLog("User logged in through Facebook!")
            }
            
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

