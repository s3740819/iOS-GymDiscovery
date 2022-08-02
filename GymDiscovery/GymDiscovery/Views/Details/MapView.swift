//
//  MapView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID()
    var location: CLLocationCoordinate2D
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [Place(location: coordinate)]){
            MapPin(coordinate: $0.location)
        }
        .onAppear {
            setRegion(coordinate)
        }
    }
    
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
