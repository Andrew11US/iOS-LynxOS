//
//  ShakeVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 7/2/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ShakeVC: UIViewController {

    @IBOutlet weak var viewForImage: UIImageView!
    
    let images = ["1", "2", "3"]
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print("Shake")
            
            viewForImage.image = UIImage(named: images[currentImage] + ".jpg")
            
            if currentImage == images.count - 1 {
                currentImage = 0
            } else {
                currentImage += 1
            }
        }
    }

}
