//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 27/12/2021.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - Properties
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
                
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52)
               
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
