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
    Gym List Rendering
 */
struct GymList: View {
    // Flag for moving back to Welcome Screen
    @Binding var isInit : Bool

    // Search purpose
    @State var searchString = ""
    
    // to sync screen-mode for all detail views
    @State var darkMode = false

    var body: some View {
        NavigationView {
            List(searchResult){
                // Row Initialization
                gymItem in
                NavigationLink{
                    DetailCard(gym: gymItem, darkMode: $darkMode)
                } label: {
                    GymRow(gym: gymItem)
                        .padding(.vertical, 10)
                }
                .navigationTitle("Gym List 🏋")
            }
            .toolbar {
                // For Moving Back To Welcome Screen
                ToolbarItem (placement: .navigationBarLeading) {
                    Button("Back", action: {
                        isInit = true
                    })
                }
            }
            .searchable(text: $searchString)
        }
    }
    
    // Search Result
    var searchResult: [Gym] {
        if searchString.isEmpty {
            return gymList
        }

        return gymList.filter {
            $0.name.lowercased()
                .contains(searchString.lowercased())
        }
    }
}

struct GymList_Previews: PreviewProvider {
    static var previews: some View {
        GymList(isInit: .constant(false))
    }
}
