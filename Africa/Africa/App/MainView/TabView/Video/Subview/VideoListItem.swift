//
//  VideoListItem.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 22/12/2021.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - Properties
    let video: Video
    
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var videos: [Video] = Bundle.main.decode(file: "videos.json")
    static var previews: some View {
        VideoListItem(video: videos[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
