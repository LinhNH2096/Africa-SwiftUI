//
//  MapView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 09/12/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        let centerLocation = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let span = MKCoordinateSpan(latitudeDelta: 50.0, longitudeDelta: 50.0)
       return MKCoordinateRegion(center: centerLocation, span: span)
    }()
    
    private var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    // MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(8)
                )
                .padding()
                
            ,alignment: .top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
