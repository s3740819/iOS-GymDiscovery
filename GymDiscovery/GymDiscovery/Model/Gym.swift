/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 1
    Author: Tran Kim Bao
    ID: s3740819
    Created Date: 01/08/2022
    Last Modified: 05/08/2022
    Acknowledgement:
        - Google Map: For Coordinate Checking
        - https://saigonkisstours.com/recommended-gyms-in-ho-chi-minh/
 */

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

