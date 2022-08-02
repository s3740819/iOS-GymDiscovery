
import SwiftUI

class BurbleInstance: ObservableObject {
    let offset: CGSize
    let frameHeightRatio: CGFloat

    init() {
        frameHeightRatio = CGFloat.random(in: 0.3 ..< 1.3)
        offset = CGSize(width: CGFloat.random(in: -150 ..< 150),
                        height: CGFloat.random(in: -150 ..< 150))
    }
}

struct Burble: View {
    @StateObject var burble = BurbleInstance()
    @State var move = false
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
            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: move)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .opacity(0.5)
            .onAppear {
                move.toggle()
            }
    }
}

struct FloatingBurbles: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ColorThemes.darkgreen
                Burble(proxy: proxy,
                      color: ColorThemes.burblesTopRight(forScheme: scheme),
                      start: 0,
                      duration: 60,
                      alignment: .bottomTrailing)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesTopRight(forScheme: scheme),
                      start: 240,
                      duration: 50,
                      alignment: .topTrailing)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesBottomLeft(forScheme: scheme),
                      start: 120,
                      duration: 80,
                      alignment: .bottomLeading)
                Burble(proxy: proxy,
                      color: ColorThemes.burblesTopLeft(forScheme: scheme),
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
