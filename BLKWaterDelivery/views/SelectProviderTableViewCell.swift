//
//  SelectProviderTableViewCell.swift
//  BLKWaterDelivery
//
//  Created by black9 on 02/07/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

import UIKit

class SelectProviderTableViewCell: UITableViewCell {

    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionField: UITextView!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func makeOrder(sender: UIButton) {
        
    }
}
