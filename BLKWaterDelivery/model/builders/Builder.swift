//
//  Builder.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import Foundation

protocol Builder
{
    var requestParameters: Dictionary <String,String>? {get set}
    func injectDependencies()
    func buildWithCompletition(handler:(result:Builder, objects:Array<AnyObject>) -> Void)
}
