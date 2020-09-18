//
//  HeartBeat.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct HeartBeat: View {
    @State var scale: CGFloat = 1
    @State private var animation = 0.0

    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.pink)
            .scaleEffect(scale)
            .animation(
                Animation.easeOut(duration: 0.5)
                    .repeatForever(autoreverses: true)
            )
            .overlay(
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.pink)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            )
            .onAppear {
                withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
            .onAppear {
                self.scale = 1.5
            }

        
    }
}

struct HeartBeat_Previews: PreviewProvider {
    static var previews: some View {
        HeartBeat()
    }
}



//var body: some View {
//    Button {
//        print("Pressed")
//    } label: {
//        Image(systemName: "star")
//    }
//    .padding()
//    .background(Color.blue)
//    .clipShape(Circle())
//    .foregroundColor(.white)
//    .padding(4)
//    .overlay(
//        Circle()
//            .stroke(Color.blue, lineWidth: 2)
//            .scaleEffect(CGFloat(1 + animation))
//            .opacity(1 - animation)
//    )
//    .onAppear {
//        withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
//            animation = 1
//        }
//    }
//}
