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
    Burble Position  Generator (Randomly)
 */
class BurblePosition: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat

    init() {
        frameHeightRatio = CGFloat.random(in: 0.3 ..< 1.3)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}

/**
    Burble Instance Generator
 */
struct Burble: View {
    @StateObject var burble = BurblePosition()
    @State var move = false
    
    // Required input vars
    let proxy: GeometryProxy
    let color: Color
    let start: Double
    let duration: Double
    let alignment: Alignment

    var body: some View {
        Circle()
            .fill(color)
            .frame(height: proxy.size.height /  burble.frameHeightRatio)
            .offset(burble.offset)
            .rotationEffect(.init(degrees: move ? start : start + 360) )
            .animation(
                Animation
                    .linear(duration: duration)
                    .repeatForever(autoreverses: false), value: move)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.5)
            .onAppear {
                move.toggle()
            }
    }
}

/**
    Welcome View - Background Rendering
 */
struct FloatingBurbles: View {
    @Environment(\.colorScheme) var screenMode

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // Set background
                ColorThemes.darkgreen
                
                // Render 4 burbles with random position
                Burble(proxy: proxy,
                       color: ColorThemes.burblesTopRight(isDark: screenMode == .dark),
                      start: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesTopRight(isDark: screenMode == .dark),
                      start: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesBottomLeft(isDark: screenMode == .dark),
                      start: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesTopLeft(isDark: screenMode == .dark),
                      start: 180,
                      duration: 70,
                      alignment: .topLeading)
            }
            .ignoresSafeArea()
        }
    }
}

struct FloatingBurblePreview: PreviewProvider {
    static var previews: some View {
        FloatingBurbles()
    }
}
