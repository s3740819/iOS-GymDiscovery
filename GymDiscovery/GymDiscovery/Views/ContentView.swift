//
//  ContentView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI

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
