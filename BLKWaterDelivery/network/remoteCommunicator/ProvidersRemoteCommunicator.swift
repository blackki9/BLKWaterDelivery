//
//  ProvidersRemoteCommunicator.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let ProvidersRemoteFunctionName = "loadProvidersForDefaultCity"
let ProvidersGetUpdatesFunctionName = "getUpdatesForProviders"
class ProvidersRemoteCommunicator: NSObject, RemoteCommunicator {
    func loadDataWithParameters(params:Dictionary<String,String>,callback:(result:String?)->Void)
    {
        ParseRequestsWrapper.callFunctionWithName(ProvidersRemoteFunctionName, parameters: params) { (response, error) -> Void in
            let resultString = response as! String
            callback(result: resultString)
        }
    }
    
    func getUpdatesAfterDate(updateDate:NSDate,completition:(result:String?)->Void)
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let updateDateString = dateFormatter.stringFromDate(updateDate)
        
        ParseRequestsWrapper.callFunctionWithName(ProvidersGetUpdatesFunctionName, parameters: ["updateDate":updateDateString]) { (response, error) -> Void in
            completition(result:response as? String)
        }
    }

}
