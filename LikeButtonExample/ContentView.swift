import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
