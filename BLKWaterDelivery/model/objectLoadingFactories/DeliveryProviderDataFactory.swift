//
//  DeliveryProviderDataFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 16/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class DeliveryProviderDataFactory: NSObject,ObjectLoadingFactory {
    func localDataProvider() -> LocalDataProvider
    {
        return LocalDeliveryProviderDataProvider()
    }
    func updater() -> Updater
    {
        return DeliveryProvidersUpdater()
    }
}
