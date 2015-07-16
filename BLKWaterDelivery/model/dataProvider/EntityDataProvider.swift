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
    var finishHandler:((objects:Array<AnyObject>)->Void)?
    
    required init(factory:ObjectLoadingFactory)
    {
        localDataProvider = factory.localDataProvider()
        updater = factory.updater()
    }
    
    func loadObjectsWithHandler(handler:(objects:Array<AnyObject>)->Void)
    {
        finishHandler = handler

        if let connected = reachabilityChecker?.isConnectedToNetwork() {
            if connected {
                self.updater?.updateItemsWithCompletitionHandler({[weak self] (completed) -> Void in
                    self?.loadAndHandleLocalObjects()
                })
            }
            else {
                self.loadAndHandleLocalObjects()
            }
        }
        else {
            self.loadAndHandleLocalObjects()
        }
    }
    func loadAndHandleLocalObjects()
    {
        if let localObjects = localDataProvider?.allItems() {
            finishHandler?(objects: localObjects);
            finishHandler = nil
        }
    }
}
