//
//  DataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 11/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Foundation

protocol DataProvider
{
    var localDataProvider:LocalDataProvider? {get set}
    var updater:Updater? {get set}
    var reachabilityChecker:ReachabilityChecker? {get set}
}