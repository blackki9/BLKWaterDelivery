//
//  JSONParser.swift
//  BLKWaterDelivery
//
//  Created by black9 on 13/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
    func parse(input:String?)-> Dictionary<String,AnyObject?>?
    {
        if let inputString = input {
            let data = inputString.dataUsingEncoding(NSUTF8StringEncoding   )
            do {
                let parsedObject: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                return ["data":parsedObject]
            }
        }
        
        return nil
    }
}
