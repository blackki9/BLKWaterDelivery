//
//  Updater.swift
//  BLKWaterDelivery
//
//  Created by black9 on 11/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Foundation

protocol Updater
{
    var remoteCommunicator:RemoteCommunicator? {get set}
    var parser:JSONParser? {get set}
    var completitionHandler:((updated:Bool)->Void)? {get set}
    var objectCreator:ObjectCreator? {get set}
    
    func saveLastUpdateDate(date:NSDate)->Void
    func updateItemsWithCompletitionHandler(completitionHandler:(completed:Bool)->Void)
}