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
    Controller View Rendering
 */
struct ContentView: View {
    @State var isInit: Bool = true
    var body: some View {
        ZStack {
            if isInit {
                GreetingView(active: $isInit)
            } else {
                GymList(isInit: $isInit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GymList(isInit: .constant(false))
    }
}
