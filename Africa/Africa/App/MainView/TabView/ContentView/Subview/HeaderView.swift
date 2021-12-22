//
//  GalleryHeaderView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 10/12/2021.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    let headerImage: String
    let headerTitle: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headerImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headerTitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerImage: "photo.on.rectangle.angled", headerTitle: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
