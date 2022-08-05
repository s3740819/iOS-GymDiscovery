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

struct GymList: View {
    @Binding var isInit : Bool
    @State var searchString = ""
    @State var darkMode = false
    var body: some View {
        NavigationView {
            List(searchResults){
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
                ToolbarItem (placement: .navigationBarLeading) {
                    Button("Back", action: {
                        isInit = true
                    })
                }
            }
            .searchable(text: $searchString)
        }
    }
    
    var searchResults: [Gym] {
        if searchString.isEmpty {
            return gymList
        }
        return gymList.filter { $0.name.lowercased().contains(searchString.lowercased()) }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        GymList(isInit: .constant(false))
    }
}
