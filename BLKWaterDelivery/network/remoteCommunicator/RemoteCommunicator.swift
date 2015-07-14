//
//  RemoteCommunicator.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol RemoteCommunicator
{
    func loadDataWithParameters(params:Dictionary<String,String>,callback:(result:String?)->Void)
    func getUpdatesAfterDate(updateDate:NSDate,completition:(result:String?)->Void)
    
}