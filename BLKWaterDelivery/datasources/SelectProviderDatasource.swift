//
//  SelectProviderDatasource.swift
//  BLKWaterDelivery
//
//  Created by black9 on 02/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let SelectProviderCellIdentifier = "SelectProviderCell"

class SelectProviderDatasource: NSObject, UITableViewDataSource {
    
    var allProviders:Array<AnyObject>?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count = 0
        if let providersCount = self.allProviders?.count {
            count = providersCount
        }
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:SelectProviderTableViewCell = tableView.dequeueReusableCellWithIdentifier(SelectProviderCellIdentifier)! as! SelectProviderTableViewCell
        if let object = allProviders?[indexPath.row] {
            let deliveryProvider = object as! DeliveryProvider
            cell.nameLabel.text = deliveryProvider.name;
        }
        
        return cell;
    }
}
