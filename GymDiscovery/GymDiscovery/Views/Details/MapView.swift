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
import MapKit

/**
    Map Pin Object
 */
struct Place: Identifiable {
    var id = UUID()
    var location: CLLocationCoordinate2D
}

/**
    Map Redering
 */
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        // Reder Map
        Map(coordinateRegion: $region, annotationItems: [Place(location: coordinate)]) {
            // Pin the specified location
            MapPin(coordinate: $0.location)
        }
        .onAppear {
            // Focus on the specified location
            setRegion(coordinate)
        }
    }
    
    // move and focus on the specified location
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
