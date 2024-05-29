//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Saad Tahir on 29/05/2024.
//

import AVFoundation

class PlaySound {
    static let shared = PlaySound()
    
    var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func play(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error: Couldnot find and play Sound file.")
            }
        }
    }
}
