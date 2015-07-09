//
//  ProviderBuilder.swift
//  BLKWaterDelivery
//
//  Created by black9 on 09/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class ProviderBuilder: BaseBuilder {
    override func injectDependencies()
    {
        self.objectCreator = ProviderObjectCreator()
        self.remoteCommunicator = ProvidersRemoteCommunicator()
        self.requestParameters = [:]
    }
}
