//
//  ObjectLoadingFactory.swift
//  BLKWaterDelivery
//
//  Created by black9 on 16/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Foundation

protocol ObjectLoadingFactory
{
    func localDataProvider() -> LocalDataProvider
    func updater() -> Updater
}