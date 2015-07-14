//
//  ObjectCreator.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol ObjectCreator
{
    func createObjectsWithData(objectData:Dictionary<String,AnyObject?>,completition:(Array<AnyObject>)->Void) -> Void
    func createObjectWithData(objectData:Dictionary<String,AnyObject?>)
    func updateObject(object:AnyObject, withData:Dictionary<String,AnyObject?>)
    
}