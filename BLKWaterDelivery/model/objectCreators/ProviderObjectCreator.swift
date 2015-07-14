//
//  ProviderObjectCreator.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class ProviderObjectCreator: NSObject, ObjectCreator {
    
    var completition:((Array<AnyObject>)->Void)?

    func createObjectsWithData(objectData:Dictionary<String,AnyObject?>,completition:(Array<AnyObject>)->Void) -> Void    {
        let objectsArray = objectData["data"]
        self.completition = completition
        
        MagicalRecord.saveWithBlock {[weak self] (context:NSManagedObjectContext!) -> Void in
            var resultArray = Array<DeliveryProvider>()
            if let array = objectsArray as! NSArray? {
                for provider in array {
                    resultArray.append((self?.newObjectWithInfo(provider as! Dictionary<String,AnyObject?>, context: context))!)
                }
            }
            print(resultArray)
            self?.completition?(resultArray)
        }
    }
    func newObjectWithInfo(provider:Dictionary<String,AnyObject?>,context:NSManagedObjectContext!) -> DeliveryProvider
    {
        let newObject = DeliveryProvider.MR_createEntityInContext(context)
        self.updateProvider(newObject, withInfo: provider)
        return newObject
    }
    func updateProvider(item:DeliveryProvider, withInfo:Dictionary<String,AnyObject?>)
    {
        item.name = withInfo["name"] as? String;
        item.objectId = withInfo["objectId"] as? String
        item.providerDescription = withInfo["Description"] as? String
        item.site = withInfo["site"] as? String
        item.logoURL = withInfo["logoImageUrl"] as? String
        item.contactInfoObjectId = (withInfo["contactInfo"] as? NSDictionary)?["objectId"] as? String
        item.lastUpdateAt = withInfo["updatedAt"] as? NSDate
    }
    
    func createObjectWithData(objectData:Dictionary<String,AnyObject?>)
    {
        MagicalRecord.saveWithBlockAndWait { (context:NSManagedObjectContext!) -> Void in
            self.newObjectWithInfo(objectData, context: context)
        }
    }
    
    func updateObject(object:AnyObject, withData:Dictionary<String,AnyObject?>)
    {
        MagicalRecord.saveWithBlockAndWait {[weak self] (context:NSManagedObjectContext!) -> Void in
            self?.updateProvider(object as! DeliveryProvider, withInfo: withData)
        }
    }
}
