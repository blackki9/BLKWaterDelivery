//
//  DBManager.swift
//  BLKWaterDelivery
//
//  Created by black9 on 07/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class DBManager: NSObject {
    class var sharedInstance: DBManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: DBManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DBManager()
        }
        return Static.instance!
    }
    
    func save()
    {
    }
    
}
