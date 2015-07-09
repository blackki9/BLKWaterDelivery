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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return tableView.dequeueReusableCellWithIdentifier(SelectProviderCellIdentifier)! as UITableViewCell
    }
}
