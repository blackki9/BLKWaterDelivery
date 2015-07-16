//
//  ProvidersDataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class EntityDataProvider: NSObject, DataProvider {
    var localDataProvider:LocalDataProvider?
    var updater:Updater?
    var reachabilityChecker:ReachabilityChecker? = ReachabilityChecker()
    var finishHandler:((providers:Array<AnyObject>)->Void)?
    
    required init(factory:ObjectLoadingFactory)
    {
        localDataProvider = factory.localDataProvider()
        updater = factory.updater()
    }
    
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
    func loadAndHandleLocalProviders()
    {
        if let providers = localDataProvider?.allItems() {
            finishHandler?(providers: providers);
            finishHandler = nil
        }
    }
}
