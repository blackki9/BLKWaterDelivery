//
//  AppDelegate.swift
//  BLKWaterDelivery
//
//  Created by black9 on 01/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        initParseWithLaunchOptions(launchOptions)
        MagicalRecord.setupCoreDataStackWithStoreNamed("BLKWaterDelivery")
        
        ParseRequestsWrapper.callFunctionWithName("loadContactInfoForProviders", parameters: ["objectIdsArray":["zFlRNScYAI"]], callback: { (response, error) -> Void in
                print(response as! String)
            });
        
        return true
    }
    func initParseWithLaunchOptions(launchOptions: [NSObject: AnyObject]?)
    {
        Parse.enableLocalDatastore()
        Parse.setApplicationId("Alc8zz2jiOXicJlvLHnxLqe0Xzi3ZxXX15n05iPE",
            clientKey: "V4XTLW11hmv7Kflx0Y0xuZ6VnDnwF3pgBi7cTnlu")
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
    }

}

