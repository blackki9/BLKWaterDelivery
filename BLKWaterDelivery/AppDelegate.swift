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
       
//        ParseRequestsWrapper.callFunctionWithName("loadContactInfoForProvider", parameters: ["contactInfoObjectId":"zFlRNScYAI"], callback:{
//            (response: AnyObject?, error: NSError?) -> Void in
//            let responseOptional = response as? String
//            if let responseString = responseOptional {
//                println(responseString)
//            }
//            else {
//                
//            }
//        })
//        ParseRequestsWrapper.callFunctionWithName("loadProvidersForDefaultCity", parameters: [:], callback: {
//            (response: AnyObject?, error: NSError?) -> Void in
//            let responseOptional = response as? String
//            if let responseString = responseOptional {
//                println(responseString)
//            }
//            
//        })
        let factory = RemoteCommunicatorFactory()
        
        factory.providersCommunicator().loadDataWithParameters([:], callback: { (result) -> Void in
           print(result!)
        })
        
        factory.contactInfoCommunicator().loadDataWithParameters(["contactInfoObjectId":"zFlRNScYAI"], callback: { (result) -> Void in
            print(result!)
        })
               // Override point for customization after application launch.
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

