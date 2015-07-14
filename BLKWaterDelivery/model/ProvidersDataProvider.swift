//
//  ProvidersDataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class ProvidersDataProvider: NSObject, DataProvider {
    var localDataProvider:LocalDataProvider? = LocalDeliveryProviderDataProvider()
    var updater:Updater? = DeliveryProvidersUpdater()
    var reachabilityChecker:ReachabilityChecker? = ReachabilityChecker()
    var finishHandler:((providers:Array<AnyObject>)->Void)?
    
    func loadProvidersWithHandler(handler:(providers:Array<AnyObject>)->Void)
    {
        finishHandler = handler

        if let connected = reachabilityChecker?.isConnectedToNetwork() {
            if connected {
                self.updater?.updateItemsWithCompletitionHandler({[weak self] (completed) -> Void in
                    self?.loadAndHandleLocalProviders()
                })
            }
            else {
                self.loadAndHandleLocalProviders()
            }
        }
        else {
            self.loadAndHandleLocalProviders()
        }
    }
    func isHasUpdates(handler:(Bool)->Void)
    {
        handler(true)
    }
    func loadAndHandleLocalProviders()
    {
        if let providers = localDataProvider?.allItems() {
            finishHandler?(providers: providers);
            finishHandler = nil
        }
    }
}
