//
//  LocalDataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Foundation

protocol LocalDataProvider
{
    func allItems() -> Array<AnyObject>
}