//
//  ContactList.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

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
        return gymList.filter { $0.name.contains(searchString) }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        GymList(isInit: .constant(false))
    }
}
