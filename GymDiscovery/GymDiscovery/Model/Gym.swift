//
//  Contact.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Gym: Identifiable, Codable{
    var id: Int
    var name: String
    var phone: String
    var images: [String]
    var caption: String
    var address: String
    var openingHours: [String]
    var homepage: String
    var description: String
    private var imageName: String
    private var coordinates: Coordinates
    
    var image: Image {
        Image(imageName)
    }
        
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}

