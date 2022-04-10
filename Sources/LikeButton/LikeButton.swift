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
                    .animation(.easeOut, value: self.isLiked)

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
        .foregroundColor(isLiked ? .red : .secondary)
    }
}

#if DEBUG
struct LikeButtonExampleView: View {
    @State var isLiked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 15) {
                Text("Lorem Ipsum")
                    .font(.headline)
            }
            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
            LikeButton(isLiked: $isLiked)
            Spacer()
        }
        .padding()
    }
}

struct LikeButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        LikeButtonExampleView()
    }
}
#endif
