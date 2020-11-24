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

        // Cadena SER [https://22613.live.streamtheworld.com/CADENASERAAC.aac?csegid=12000&;amp;gdpr=1&amp;gdpr_consent=BO3qPm0O3qPnDAHABBESDV-AAAAx5r_7__7-_9_-_f__9uj3Or_v_f__32ccL59v_h_7v-_7fi_-0nV4u_1vft9yfkx-5ctDztp5w7iakivXmqde]
        // Los 40 Principales [https://21223.live.streamtheworld.com/LOS40_SC]
        // Cadena COPE [https://flucast-m04-06.flumotion.com/cope/net1.mp3]
        // Cadena Dial [https://20853.live.streamtheworld.com/CADENADIAL_SC?]
        // Onda Cero [http://icecast-streaming.nice264.com/ondacero]
        // CADENA 100 [http://cadena100-streamers-mp3.flumotion.com/cope/cadena100.mp3]
        // Europa FM [https://icecast-streaming.nice264.com/europafmback]
        // RNE [https://hlsliveamdgl0-lh.akamaihd.net/i/rnerne_1@586398/master.m3u8]
        // Rock FM [http://flucast-m01-01.flumotion.com/cope/rockfm-low.mp3]
        // Kiss FM [http://kissfm.kissfmradio.cires21.com/kissfm.mp3]

        // Cuarto Milenio (Oficial) [http://api.ivoox.com/cuarto-milenio-22-11-2020-15x38-dossier-hallazgos-alcasser_mn_60774640_api_1.mp3]
        // Nadie sabe nada, con Buenafuente y Berto [http://api.ivoox.com/nadie-sabe-nada-las-vacas-via_mn_60737272_api_1.mp3]
        // El Partidazo de COPE [http://api.ivoox.com/km42-8216-running-8217-chema-martinez-23-11-2020_mn_60821792_api_1.mp3]
        // DIAS EXTRAÑOS con Santiago Camacho [http://api.ivoox.com/dex-04x13-el-triangulo-de-bridgewater_mn_60747880_api_1.mp3]
        // La Voz de César Vidal [http://api.ivoox.com/palabras-al-aire-23-11-20_mn_60813388_api_1.mp3]
        // La ContraCrónica [http://api.ivoox.com/circulo-se-cierra-para-trump_mn_60812748_api_1.mp3]
        // La Rosa de los Vientos [http://api.ivoox.com/mujeres-historia-jan-morris-fue-hombre-y_mn_60795310_api_1.mp3]

        guard let url = URL(string:"http://api.ivoox.com/mujeres-historia-jan-morris-fue-hombre-y_mn_60795310_api_1.mp3") else {
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
