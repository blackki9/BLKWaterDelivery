//
//  Updater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 11/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Foundation

protocol Updater
{
    func updateItemsWithCompletitionHandler(completitionHandler:(completed:Bool)->Void)
}