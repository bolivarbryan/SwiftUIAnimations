//
//  ButtonEffectView.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct ButtonEffectView: View {
    var body: some View {
        AnimatedButton(buttonStyle: SpinningArcsButtonStyle.self, animationSpeed: 1) {
            print("Pressed")
        } label: {
            Image(systemName: "star")
        }
    }
    
}

struct ButtonEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonEffectView()
    }
}
