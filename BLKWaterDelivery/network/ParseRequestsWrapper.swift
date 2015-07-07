//
//  ParseRequestsWrapper.swift
//  BLKWaterDelivery
//
//  Created by black9 on 05/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ParseRequestsWrapper: NSObject {
 
    static func callFunctionWithName(functionName:String,parameters:Dictionary<String,String>,callback: (response: AnyObject?, error: NSError?)->Void) {
        PFCloud.callFunctionInBackground(functionName, withParameters:parameters) {
            (response: AnyObject?, error: NSError?) -> Void in
            callback(response: response, error: error)
        }
    }
    
}
