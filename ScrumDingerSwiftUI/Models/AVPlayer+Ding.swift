//
//  AVPlayer+Ding.swift
//  ScrumDingerSwiftUI
//
//  Created by Aleksandr Eliseev on 15.01.2023.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "mp3") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
