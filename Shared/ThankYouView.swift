//
//  ThankYouView.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct ThankYouView: View {
    @State private var cardFlipped = false

    var body: some View {
        FlipView(isFlipped: cardFlipped) {
             Text("Muchas Gracias!")
        } back: {
             Image("logo")
        }
        .animation(.spring(response: 0.35, dampingFraction: 0.7))
        .onTapGesture {
            cardFlipped.toggle()
        }
     
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView()
    }
}
