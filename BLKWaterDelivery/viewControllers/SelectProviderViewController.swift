//
//  ViewController.swift
//  BLKWaterDelivery
//
//  Created by black9 on 01/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

let showProviderInfoSegueIdentifier = "ShowProviderInfoSegue"

class SelectProviderViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var dataProvider:ProvidersDataProvider?
    
    private let dataSource:SelectProviderDatasource = SelectProviderDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource;
        loadProviders()
    }
    func loadProviders()
    {
        dataProvider?.loadProvidersWithHandler({(providers:Array<AnyObject>)->Void in
            self.dataSource.allProviders = providers;
            dispatch_sync(dispatch_get_main_queue(), {[weak self] () -> Void in
                self?.tableView?.reloadData()
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SelectProviderViewController : UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

