//
//  ProvidersDataProvider.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class ProvidersDataProvider: NSObject, DataProvider {
    var localDataProvider:LocalDataProvider?
    var builder:Builder?
    var updater:Updater?
    var reachabilityChecker:ReachabilityChecker?
    var finishHandler:((providers:Array<AnyObject>)->Void)?
    
    func loadProvidersWithHandler(handler:(providers:Array<AnyObject>)->Void)
    {
        finishHandler = handler

        if let connected = reachabilityChecker?.isConnectedToNetwork() {
            if connected {
                self.isHasUpdates() { [weak self] (hasUpdates:Bool) -> Void in
                    if hasUpdates {
                        self?.updater?.updateItemsWithCompletitionHandler({(completed) -> Void in
                            self?.loadAndHandleLocalProviders()
                        })
                    }
                    else {
                        self?.builder?.buildWithCompletition({ (result, objects) -> Void in
                            self?.finishHandler?(providers: objects as Array<AnyObject>)
                        })
                    }
                }
            }
            else {
                self.loadAndHandleLocalProviders()
            }
        }
    }
    func isHasUpdates(handler:(Bool)->Void)
    {
        
    }
    func loadAndHandleLocalProviders()
    {
        if let providers = localDataProvider?.allItems() {
            finishHandler?(providers: providers);
        }
    }
}
