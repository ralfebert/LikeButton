import SwiftUI

struct CirclesView: View {
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

struct LikeButtonView: View {
    @State var scale = 1.0
    @State var opacity = 0.0
    @State var isLiked = false

    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: "heart.fill")
                    .opacity(isLiked ? 1 : 0)
                    .scaleEffect(isLiked ? 1.0 : 0.1)
                    .animation(.easeOut)

                Image(systemName: "heart")
            }
            .imageScale(.large)
            .scaleEffect(1.5)

            Group {
                CirclesView(count: 9, radius: 30, speed: 0.1, scale: self.isLiked ? 0.1 : 0.8)
                CirclesView(count: 9, radius: 35, speed: 0.2, scale: self.isLiked ? 0.1 : 0.6)
                    .rotationEffect(Angle(degrees: 20))
            }
            .opacity(self.opacity)
        }
        .onTapGesture {
            self.isLiked.toggle()
            self.scale = 1.0
            if isLiked {
                withAnimation(.linear(duration: 0.2)) {
                    self.scale = 1.3
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

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButtonView()
    }
}
