//
//  BaseUpdater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 14/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class BaseUpdater: NSObject,Updater {
    var remoteCommunicator:RemoteCommunicator?
    var parser:JSONParser? = JSONParser()
    var completitionHandler:((updated:Bool)->Void)?
    var objectCreator:ObjectCreator?
    
    func updateItemsWithCompletitionHandler(completitionHandler:(completed:Bool)->Void)
    {
        self.completitionHandler = completitionHandler
//TODO - make use of proper update date
        self.saveLastUpdateDate(NSDate(timeIntervalSince1970: 0))
        
        if let communicator = self.remoteCommunicator,let date = self.lastUpdateDate {
            communicator.getUpdatesAfterDate(date, completition: {[weak self] (result) -> Void in
                if let info = self?.parser?.parse(result) {
                    self?.updateItemsWithInfo(info as! Dictionary<String,AnyObject>)
                    self?.completitionHandler?(updated:true)
                    self?.completitionHandler = nil
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
                self.updateItemWithInfo(value as! Dictionary<String, AnyObject>)
            }
        }
    }
    func updateItemWithInfo(objectInfo:Dictionary<String, AnyObject>)
    {
        let object = self.findObjectByObjectId(objectInfo["objectId"] as! String)
        if let unwrappedObject = object {
            objectCreator?.updateObject(unwrappedObject, withData: objectInfo)
        }
        else {
            objectCreator?.createObjectWithData(objectInfo)
        }
    }
    func findObjectByObjectId(objectId:String) -> NSManagedObject?
    {
        return nil
    }
    func notifyAboutError() {
        self.completitionHandler?(updated:false)
    }

}
