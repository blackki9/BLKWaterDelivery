//
//  DeliveryProvidersUpdater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 14/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class DeliveryProvidersUpdater: BaseUpdater {
    override init()
    {
        super.init()
        self.remoteCommunicator = RemoteCommunicatorFactory.providersCommunicator()
        self.parser = JSONParser()
        self.objectCreator = ObjectCreatorFactory.providerObjectCreator()
    }
    
    override func findObjectByObjectId(objectId:String) -> NSManagedObject?
    {
        let predicate = NSPredicate(format: "objectId == %@", objectId)
        return DeliveryProvider.MR_findFirstWithPredicate(predicate)
    }
    
}
