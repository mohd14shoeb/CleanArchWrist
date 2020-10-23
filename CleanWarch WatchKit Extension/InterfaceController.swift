//
//  InterfaceController.swift
//  CleanWarch WatchKit Extension
//
//  Created by Laura on 16/10/2020.
//

import WatchKit
import Foundation
import AVFoundation

class InterfaceController: WKInterfaceController {
    
    var player: AVPlayer?

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user

        /*let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .default,
                                    options: [.allowBluetoothA2DP])
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }

        // API ivoox: https://api.ivoox.com/1-4/?format=json&function=getRecommends&session=3020789161296912
        // Radio ivoox: https://21223.live.streamtheworld.com/LOS40_SC
        // Audio ivoox: http://api.ivoox.com/93-sasquatchs-bigfoots-monstruos-america-criptozoologia_mn_56495554_api_1.mp3

        // Set up the player.
        guard let url = URL(string:"http://kissfm.kissfmradio.cires21.com/kissfm.mp3") else {
            return
        }

        let asset  = AVURLAsset(url: url, options: nil)
        let item   = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
        player = AVPlayer(playerItem: item)

        // Activate and request the route.
        session.activate(options: []) { (success, error) in
            guard error == nil else {
                print("*** An error occurred: \(error!.localizedDescription) ***")
                // Handle the error here.
                return
            }
            
            // Play the audio file.
            self.player?.play()
        }*/
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}

extension InterfaceController {
    @IBAction func didPressButton() {
        fatalError()
    }
}
