//
//  AppDelegate.swift
//  Tindergram
//
//  Created by thomas on 3/31/15.
//  Copyright (c) 2015 thomas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Parse.setApplicationId("ugrYkntHZyF6EU8yocAPBdqYklXaQIf06Xqttobp", clientKey: "A240mQO9ac07C60tcItS9WXPSehp0hSogcJZiv25")
    
    // let testObject = PFObject(className: "TestObject")
    // testObject["foo"] = "bar"
    // testObject.save()
    
    return true
  }

}

