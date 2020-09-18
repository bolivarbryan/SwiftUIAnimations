//
//  RotationView.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct RotationView: View {
    @State private var flag = true
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(flag ? .green : .blue)
                .frame(width: flag ? 50 : 100, height: 50)
                .rotationEffect(Angle(degrees: flag ? 360 : 0))
                .offset(x: flag ? -100 : 100)
                .animation(.easeInOut(duration: 2.0))
            
            Button("Animate") {
                self.flag.toggle()
            }
            .font(.title)

        }
    }
}

struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView()
    }
}
