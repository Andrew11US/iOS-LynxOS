//
//  ClockVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/28/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ClockVC: UIViewController {

    @IBOutlet weak var time: UILabel!
    
    var timeToFire = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ClockVC.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        timeToFire = 0
        time.text = String(timeToFire)
    }
    
    func action() {
        timeToFire += 1
        time.text = String(timeToFire)
    }

}
