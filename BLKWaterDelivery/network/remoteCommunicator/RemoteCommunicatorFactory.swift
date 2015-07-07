//
//  RemoteCommunicatorFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class RemoteCommunicatorFactory: NSObject {
    func providersCommunicator() -> RemoteCommunicator
    {
        return ProvidersRemoteCommunicator()
    }
    
    func contactInfoCommunicator() -> RemoteCommunicator
    {
        return ContactInfoRemoteCommunicator()
    }
}
