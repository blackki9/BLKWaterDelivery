//
//  LocalDeliveryProviderDataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class LocalDeliveryProviderDataProvider: NSObject,LocalDataProvider {
    func allItems() -> Array<AnyObject>
    {
        return DeliveryProvider.MR_findAll()
    }
}
