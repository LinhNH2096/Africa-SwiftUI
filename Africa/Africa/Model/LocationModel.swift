//
//  LocationModel.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 27/12/2021.
//

import CoreLocation

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
