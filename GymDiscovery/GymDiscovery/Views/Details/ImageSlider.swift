import SwiftUI

struct ImageSlider<Content>: View where Content: View {

    @Binding var current: Int
    let total: Int
    let content: () -> Content

    @State private var offset = CGFloat.zero
    @State private var onDrag = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        self.content()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture().onChanged { value in
                        self.onDrag = true
                        self.offset = -CGFloat(self.current) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        let expectedOffset = -CGFloat(self.current) * geometry.size.width + value.predictedEndTranslation.width
                        let expectedIndex = Int(round(expectedOffset / -geometry.size.width))
                        self.current = self.clampedIndex(from: expectedIndex)
                        withAnimation(.easeOut) {
                            self.onDrag = false
                        }
                    }
                )
            }
            .clipped()

            SlideControl(current: $current, total: total)
        }
    }

    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.onDrag {
            return max(min(self.offset, 0), -CGFloat(self.total) * geometry.size.width)
        } else {
            return -CGFloat(self.current) * geometry.size.width
        }
    }

    func clampedIndex(from predictedIndex: Int) -> Int {
        let next = min(max(predictedIndex, self.current - 1), self.current + 1)
        if next < 0 { return 0 }
        if next > total { return total }
        return next
    }
}

struct SlideControl: View {
    @Binding var current: Int
    let total: Int

    var body: some View {
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

struct ImageSlider_Preview: PreviewProvider {
    static var previews: some View {
        VStack{
            ImageSlider(current: .constant(0), total: 2){
                ForEach(["cg-1", "cg-2"], id: \.self) {
                    imageName in
                        Image(imageName)
                        .resizable()
                }
            }
            .scaledToFit()
        }
    }
}

