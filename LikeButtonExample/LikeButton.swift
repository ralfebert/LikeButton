import SwiftUI

public struct LikeButton: View {
    @State private var scale = 1.0
    @State private var opacity = 0.0
    @Binding public var isLiked: Bool

    public var body: some View {
        ZStack {
            Group {
                Image(systemName: "heart.fill")
                    .opacity(isLiked ? 1 : 0)
                    .scaleEffect(isLiked ? 1.0 : 0.1)
                    .animation(.easeOut)

                Image(systemName: "heart")
            }
            .imageScale(.large)
            .overlay(
                Group {
                    DotsView(count: 9, radius: 20, speed: 0.1, scale: self.isLiked ? 0.1 : 0.8)
                    DotsView(count: 9, radius: 25, speed: 0.2, scale: self.isLiked ? 0.1 : 0.6)
                        .rotationEffect(Angle(degrees: 20))
                }
                .opacity(self.opacity)
            )
        }
        .onTapGesture {
            self.isLiked.toggle()
        }
        .onChange(of: self.isLiked) { isLiked in
            self.scale = 1.0
            if isLiked {
                withAnimation(.linear(duration: 0.2)) {
                    self.scale = 1.2
                    self.opacity = 1
                }
                withAnimation(.linear(duration: 0.1).delay(0.2)) {
                    self.opacity = 0
                }
            }
        }
        .scaleEffect(self.scale)
        .foregroundColor(isLiked ? .red : .gray)
    }
}

struct DotsView: View {
    let count: Int
    let radius: CGFloat
    let speed: Double
    let scale: CGFloat

    var body: some View {
        ZStack {
            ForEach(0 ..< count) { idx in
                Circle()
                    .fill(Color.red)
                    .frame(width: 10)
                    .scaleEffect(self.scale)
                    .animation(.linear(duration: self.speed))
                    .offset(y: -self.radius)
                    .rotationEffect(angle(index: idx))
            }
        }
    }

    func angle(index: Int) -> Angle {
        Angle(degrees: (360 / Double(self.count)) * Double(index))
    }
}
