//
//  ContactInfoUpdater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 14/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class ContactInfoUpdater: BaseUpdater {
    override init()
    {
        super.init()
        self.remoteCommunicator = RemoteCommunicatorFactory.contactInfoCommunicator()
        self.parser = JSONParser()
        self.objectCreator = ObjectCreatorFactory.contactInfoObjectCreator()
    }
    
    override func findObjectByObjectId(objectId:String) -> NSManagedObject?
    {
        let predicate = NSPredicate(format: "objectId == %@", objectId)
        return ContactInfo.MR_findFirstWithPredicate(predicate)
    }
}
