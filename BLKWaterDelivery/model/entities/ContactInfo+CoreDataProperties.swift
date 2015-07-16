//
//  ContactInfo+CoreDataProperties.swift
//  BLKWaterDelivery
//
//  Created by black9 on 14/07/15.
//  Copyright © 2015 black9. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension ContactInfo {

    @NSManaged var address: String?
    @NSManaged var lastUpdateAt: NSDate?
    @NSManaged var contactPersonName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var additionalInfo: String?

}
