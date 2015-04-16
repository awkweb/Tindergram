//
//  LoginViewController.swift
//  Tindergram
//
//  Created by thomas on 4/11/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func loginButtonPressed(sender: UIButton) {
    PFFacebookUtils.logInWithPermissions(["public_profile", "user_about_me", "user_birthday"], block: {
      user, error in
      
      if user == nil {
        println("Ruh-roh, the user cancelled the Facebook login.")
        return
      } else if user!.isNew {
        println("User just signed up and logged in for the first time.")
        
        FBRequestConnection.startWithGraphPath("/me?fields=picture,first_name,birthday,gender", completionHandler: {
          connection, result, error in
          
          var r = result as! NSDictionary
          
          user!["firstName"] = r["first_name"]
          user!["gender"] = r["gender"]
          
          var dateFormatter = NSDateFormatter()
          dateFormatter.dateFormat = "MM/dd/yyyy"
          user!["birthDay"] = dateFormatter.dateFromString(r["birthday"] as! String)
          
          let pictureURL = ((r["picture"] as! NSDictionary)["data"] as! NSDictionary) ["url"] as! String
          let url = NSURL(string: pictureURL)
          let request = NSURLRequest(URL: url!)
          
          NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            let imageFile = PFFile(name: "avatar.jpg", data: data)
            user!["picture"] = imageFile
            user!.saveInBackgroundWithBlock(nil)
          })
        })
      } else {
        println("User logged in through Facebook.")
      }
      
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CardsNavController") as! UIViewController
      self.presentViewController(vc, animated: true, completion: nil)
    })
  }
  
}
