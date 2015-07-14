//
//  BuildersFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 11/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class BuildersFactory: NSObject {

    static func providersBuilder() -> Builder
    {
        let result = ProviderBuilder()
        
        result.remoteCommunicator = RemoteCommunicatorFactory.providersCommunicator()
        result.objectCreator = ObjectCreatorFactory.providerObjectCreator()
        result.dbManager = DBManager.sharedInstance
        
        return result
    }
    
    static func contactInfoBuilder(objectId:String) -> Builder
    {
        let result = ContactInfoBuilder(objectId: objectId)
        
        result.remoteCommunicator = RemoteCommunicatorFactory.contactInfoCommunicator()
        result.objectCreator = ObjectCreatorFactory.contactInfoObjectCreator()
        result.dbManager = DBManager.sharedInstance
        
        return result
    }
}
