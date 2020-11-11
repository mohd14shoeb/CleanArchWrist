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
    @IBOutlet weak var playButton: WKInterfaceButton!
    private var canPlay = false

    override func awake(withContext context: Any?) {
        // Configure interface objects here.

        let session = AVAudioSession.sharedInstance()

        #if targetEnvironment(simulator)
        let options: AVAudioSession.CategoryOptions = [.allowBluetoothA2DP]
        let policy: AVAudioSession.RouteSharingPolicy = .default
        #else
        let options: AVAudioSession.CategoryOptions = []
        let policy: AVAudioSession.RouteSharingPolicy = .longFormAudio
        #endif

        do {
            try session.setCategory(.playback, mode: .default, policy: policy, options: options)
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }

        /*
        API ivoox: https://api.ivoox.com/1-4/?format=json&function=getRecommends&session=3020789161296912
        Radio: https://21223.live.streamtheworld.com/LOS40_SC
        Audio: http://api.ivoox.com/93-sasquatchs-bigfoots-monstruos-america-criptozoologia_mn_56495554_api_1.mp3
        */

        // Set up the player.
        guard let url = URL(string:"http://kissfm.kissfmradio.cires21.com/kissfm.mp3") else {
            return
        }

        // Custom user agent
        let headers: [String:String] = ["User-Agent": "Custom user agent"]

        let asset  = AVURLAsset(url: url, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
        let item   = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: nil)
        player = AVPlayer(playerItem: item)
        
        // Voice boost
        self.player?.volume = 2.0

        // Activate and request the route.
        session.activate(options: []) { [weak self] (success, error) in
            guard error == nil else {
                print("*** An error occurred: \(error!.localizedDescription) ***")
                // Handle the error here.
                return
            }
            
            // Audio can be played now
            self?.canPlay = true
            self?.playButton.setEnabled(true)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        playButton.setEnabled(canPlay)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}

extension InterfaceController {

    @IBAction func didPressPlayButton() {
        guard let player = self.player else { return }

        if player.rate > 0 {
            player.pause()
            playButton.setTitle("Play")
        } else {
            player.play()
            playButton.setTitle("Pause")
        }
    }

    @IBAction func didPressCrashButton() {
        fatalError()
    }
}
