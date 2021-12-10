//
//  CoverImageView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 10/12/2021.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: Properties
    let coverImages: [CoverImage] = Bundle.main.decode(file: "covers", type: CoverImage.self)
    
    // MARK: Body
    var body: some View {
        TabView {
            ForEach(coverImages) { image in
                Image(image.name ?? "cover-lion")
                    .resizable()
                    .scaledToFill()
            } //: Loop
        } //: Tabview
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
