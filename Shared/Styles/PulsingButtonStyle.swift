//
//  PulsingButtonStyle.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct PulsingButtonStyle: AnimatingButtonStyle {
    let animation: Double

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .clipShape(Circle())
            .foregroundColor(.white)
            .padding(4)
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            )
            
    }
}

struct AnimatedButton<ButtonStyle: AnimatingButtonStyle, Content: View>: View {

    let buttonStyle: ButtonStyle.Type

    let action: () -> Void
    let label: () -> Content
    var animationSpeed = 2.0

    @State private var animation = 0.0

    var body: some View {
        Button(action: action, label: label)
            .buttonStyle(buttonStyle.init(animation: animation))
            .onAppear {
                withAnimation(Animation.easeOut(duration: animationSpeed).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
    }
}

protocol AnimatingButtonStyle: ButtonStyle {
    init(animation: Double)
}
