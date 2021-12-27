//
//  VideoListView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 09/12/2021.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode(file: "videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(fileName: item.id, videoTitle: item.name)) {
                        VideoListItem(video: item)
                            .padding(.vertical, 8)
                    } //: Navigation Link
                }
            } //: List
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            
        } //: Navigation View
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
