//
//  JSONParser.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
    func parse(input:String?)-> Dictionary<String,JSON>?
    {
        if let inputString = input {
          let parsedObject = JSON(inputString)
            return ["data":parsedObject]
        }
        
        return nil
    }
}
