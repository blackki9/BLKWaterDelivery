//
//  ObjectCreatorFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class ObjectCreatorFactory: NSObject {
   
    func providerObjectCreator() -> ObjectCreator
    {
        return ProviderObjectCreator()
    }
    
    func contactInfoObjectCreator() -> ObjectCreator
    {
        return ContactInfoObjectCreator()
    }
}
