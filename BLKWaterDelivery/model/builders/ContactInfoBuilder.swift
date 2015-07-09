//
//  ContactInfoBuilder.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class ContactInfoBuilder: BaseBuilder {
    var objectIdParameter:String
    
    init(objectId:String) {
        self.objectIdParameter = objectId;
    }
    
    override func injectDependencies()
    {
        self.objectCreator = ContactInfoObjectCreator()
        self.remoteCommunicator = ContactInfoRemoteCommunicator()
        self.requestParameters = ["objectId":self.objectIdParameter]
    }
}
