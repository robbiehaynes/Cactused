//
//  PlaySound.swift
//  Cactused
//
//  Created by Robert Haynes on 2020/04/13.
//  Copyright © 2020 Haynes Developments. All rights reserved.
//

import Foundation
import AVFoundation


var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}
