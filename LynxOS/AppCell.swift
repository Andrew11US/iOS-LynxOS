//
//  AppCell.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(app: App) {
        
        name.text = app.appName
        iconImage.image = UIImage(named: app.appIconImage.lowercased())
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
