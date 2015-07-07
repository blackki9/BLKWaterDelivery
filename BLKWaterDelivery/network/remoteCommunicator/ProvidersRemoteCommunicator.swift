//
//  ProvidersRemoteCommunicator.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let ProvidersRemoteFunctionName = "loadProvidersForDefaultCity"

class ProvidersRemoteCommunicator: NSObject, RemoteCommunicator {
    func loadDataWithParameters(params:Dictionary<String,String>,callback:(result:String?)->Void)
    {
        ParseRequestsWrapper.callFunctionWithName(ProvidersRemoteFunctionName, parameters: params) { (response, error) -> Void in
            let resultString = response as! String
            callback(result: resultString)
        }
    }

}
