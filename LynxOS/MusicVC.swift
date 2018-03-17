//
//  MusicVC.swift
//  LynxOS
//
//  Created by Andrew Foster on 6/28/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import AVFoundation

class MusicVC: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Error handling do-try-catch block
        do {
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")!
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
        } catch {
            
        }
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func replay(_ sender: Any) {
        player.currentTime = 0
    }


}
