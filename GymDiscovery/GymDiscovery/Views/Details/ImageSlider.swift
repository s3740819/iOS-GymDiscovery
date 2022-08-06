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
    Image Slider Rendering
 */
struct ImageSlider<Content>: View where Content: View {
    // Current Image Index
    @Binding var current: Int
    
    // Input params
    let total: Int
    let content: () -> Content

    // Variable Initialization
    @State private var offset = CGFloat.zero
    @State private var onDrag = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // geometry values
            GeometryReader { geometry in
                // Horizontal slider
                ScrollView(.horizontal, showsIndicators: false) {
                    // Image rendering
                    HStack(spacing: 0) {
                        self.content()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.getOffset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                // Action Attached
                .gesture(
                    // Drag action Implementation
                    DragGesture().onChanged { value in
                        self.onDrag = true
                        self.offset = -CGFloat(self.current) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        // On drag done
                        let expectedOffset = -CGFloat(self.current) * geometry.size.width + value.predictedEndTranslation.width

                        // Next image
                        let expectedIndex = Int(round(expectedOffset / -geometry.size.width))
                        self.current = self.getIndex(from: expectedIndex)
                        
                        // Animation
                        withAnimation(.easeOut) {
                            self.onDrag = false
                        }
                    }
                )
            }
            .clipped()

            // Dot for indicating image index
            HStack(spacing: 8) {
                ForEach(0...total, id: \.self) { index in
                    Circle()
                        .fill(index == self.current ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(15)
        }
    }

    // Drag -> Obtain new offset
    func getOffset(in geometry: GeometryProxy) -> CGFloat {
        if self.onDrag {
            return max(min(self.offset, 0), -CGFloat(self.total) * geometry.size.width)
        } else {
            return -CGFloat(self.current) * geometry.size.width
        }
    }

    // Get new index after draging
    func getIndex(from expectedIndex: Int) -> Int {
        let next = min(max(expectedIndex, self.current - 1), self.current + 1)
        if next < 0 { return 0 }
        if next > total { return total }
        return next
    }
}


struct ImageSlider_Preview: PreviewProvider {
    static var previews: some View {
        VStack{
            ImageSlider(current: .constant(0), total: 2){
                ForEach(["cg-1", "cg-2"], id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                }
            }
            .scaledToFit()
        }
    }
}

