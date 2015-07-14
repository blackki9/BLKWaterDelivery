//
//  DeliveryProvidersUpdater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 14/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class DeliveryProvidersUpdater: NSObject,Updater {
    var remoteCommunicator:RemoteCommunicator? = RemoteCommunicatorFactory.providersCommunicator()
    var parser:JSONParser? = JSONParser()
    var completitionHandler:((updated:Bool)->Void)?
    var objectCreator:ObjectCreator? = ObjectCreatorFactory.providerObjectCreator()
    
    var lastUpdateDate:NSDate? {
        return NSUserDefaults.standardUserDefaults().objectForKey("lastUpdateDate") as? NSDate
    }
    
    func updateItemsWithCompletitionHandler(completitionHandler:(completed:Bool)->Void)
    {
        self.completitionHandler = completitionHandler
        self.saveLastUpdateDate(NSDate(timeIntervalSince1970: 0))
            
        if let communicator = self.remoteCommunicator,let date = self.lastUpdateDate {
            communicator.getUpdatesAfterDate(date, completition: {[weak self] (result) -> Void in
                if let info = self?.parser?.parse(result) {
                    self?.updateItemsWithInfo(info as! Dictionary<String,AnyObject>)
                }
                else {
                    self?.notifyAboutError()
                }
            })
        }
        else {
           self.notifyAboutError()
        }
    }
    func updateItemsWithInfo(info:Dictionary<String,AnyObject>)
    {
        let objectsArray = info["data"]
        if let array = objectsArray as! NSArray? {
            for value in array {
                print(value)
                self.updateItemWithInfo(value as! Dictionary<String, AnyObject>)
            }
        }
    }
    func updateItemWithInfo(objectInfo:Dictionary<String, AnyObject>)
    {
        let object = self.findObjectWithObjectId(objectInfo["objectId"] as! String)
        if let unwrappedObject = object {
            objectCreator?.updateObject(unwrappedObject, withData: objectInfo)
        }
        else {
            objectCreator?.createObjectWithData(objectInfo)
        }
    }
    func findObjectWithObjectId(objectId:String) -> DeliveryProvider?
    {
        let predicate = NSPredicate(format: "objectId == %@", objectId)
        return DeliveryProvider.MR_findFirstWithPredicate(predicate)
    }
    func notifyAboutError() {
        self.completitionHandler?(updated:false)
    }
    func saveLastUpdateDate(date:NSDate) {
        NSUserDefaults.standardUserDefaults().setObject(date, forKey: "lastUpdateDate")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
