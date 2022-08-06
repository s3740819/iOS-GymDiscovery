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

/**
    Row Rendering
 */
struct GymRow: View {
    var gym: Gym
    
    var body: some View {
        HStack {
            gym.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(15)
                .shadow(radius: 10)
            Text("  \(gym.name)")
        }
    }
}

struct GymRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GymRow(gym: gymList[0])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
