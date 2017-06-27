//
//  AppCell.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
