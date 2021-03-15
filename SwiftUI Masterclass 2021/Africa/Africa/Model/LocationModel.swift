//
//  LocationModel.swift
//  Africa
//
//  Created by Myat Thu Ko on 3/14/21.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed Properties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
