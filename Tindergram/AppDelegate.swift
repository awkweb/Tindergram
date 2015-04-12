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
    PFFacebookUtils.initializeFacebook()
    
    return true
  }
  
  func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
    return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: PFFacebookUtils.session())
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
  }
  
  func applicationWillTerminate(application: UIApplication) {
    PFFacebookUtils.session()?.close()
  }

}

