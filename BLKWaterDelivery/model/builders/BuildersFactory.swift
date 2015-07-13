//
//  BuildersFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 11/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class BuildersFactory: NSObject {

    func providersBuilder() -> Builder
    {
        return ProviderBuilder()
    }
    
    func contactInfoBuilder(objectId:String) -> Builder
    {
        return ContactInfoBuilder(objectId: objectId)
    }
}
