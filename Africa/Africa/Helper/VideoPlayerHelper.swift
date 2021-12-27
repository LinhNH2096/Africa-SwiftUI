//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 27/12/2021.
//

import AVKit

func playVideo(fileName: String, fileFormat: String = "mp4") -> AVPlayer {
    var player = AVPlayer()
    guard let url = Bundle.main.url(forResource: fileName,
                                    withExtension: fileFormat)
    else { return player }
    player = AVPlayer(url: url)
    player.play()
    return player
}
