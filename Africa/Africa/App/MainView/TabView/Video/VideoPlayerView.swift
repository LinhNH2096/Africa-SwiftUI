//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 27/12/2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Properties
    let fileName: String
    let videoTitle: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: fileName)) {
                
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                , alignment: .topLeading)
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(fileName: "lion", videoTitle: "Lion")
        }
    }
}
