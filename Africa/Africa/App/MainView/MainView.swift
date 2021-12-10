//
//  MainView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 09/12/2021.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
