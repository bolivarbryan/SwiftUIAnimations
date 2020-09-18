import SwiftUI

struct FlipView<Front: View, Back: View>: View {
    var isFlipped: Bool
    var front: () -> Front
    var back: () -> Back
    
    init(isFlipped: Bool = false, @ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.isFlipped = isFlipped
        self.front = front
        self.back = back
    }
    
    var body: some View {
        ZStack {
            front()
                .rotation3DEffect(.degrees(isFlipped == true ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isFlipped == true ? 0 : 1)
                .accessibility(hidden: isFlipped == true)

            back()
                .rotation3DEffect(.degrees(isFlipped == true ? 0 : -180), axis: (x: 0, y: 1, z: 0))
                .opacity(isFlipped == true ? 1 : 0)
                .accessibility(hidden: isFlipped == false)
        }
    }
}

struct HeartFlip: View {
    @State private var cardFlipped = false

       var body: some View {
           FlipView(isFlipped: cardFlipped) {
                Image.init(systemName: "heart")
                    .resizable()
                    .frame(width: 100, height: 100)
           } back: {
                Image.init(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.pink)
           }
           .animation(.spring(response: 0.35, dampingFraction: 0.7))
           .onTapGesture {
               cardFlipped.toggle()
           }
        
       }
}

struct HeartFlip_Previews: PreviewProvider {
    static var previews: some View {
        HeartFlip()
    }
}
