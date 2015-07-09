//
//  ObjectInfoParser.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol ObjectInfoParser
{
    func parse(input:String?)->AnyObject?
}