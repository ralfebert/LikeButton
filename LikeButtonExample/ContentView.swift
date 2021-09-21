import SwiftUI

struct ContentView: View {
    @State var isLiked = false

    var body: some View {
        LikeButton(isLiked: $isLiked)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
