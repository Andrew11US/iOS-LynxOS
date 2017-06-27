//
//  AssistantVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/27/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class AssistantVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
