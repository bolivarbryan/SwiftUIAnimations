//
//  SpinningArcsButtonStyle.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct SpinningArcsButtonStyle: AnimatingButtonStyle {
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
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.blue, lineWidth: 4)
                    .rotationEffect(.init(degrees: -animation * 360))
            )
            .padding(6)
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.blue, lineWidth: 4)
                    .rotationEffect(.init(degrees: animation * 360))
            )
    }
}
