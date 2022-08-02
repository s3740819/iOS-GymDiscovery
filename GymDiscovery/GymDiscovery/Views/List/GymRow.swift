//
//  ContactRow.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI

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

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GymRow(gym: gymList[0])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
