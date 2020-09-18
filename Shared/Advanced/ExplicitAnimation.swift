//
//  ExplicitAnimation.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var half = false
    @State private var dim = false
    
    var body: some View {
        Image(systemName: "swift")
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .scaleEffect(half ? 0.5 : 1.0)
            .opacity(dim ? 0.5 : 1.0)
            .onTapGesture {
                self.half.toggle()
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.dim.toggle()
                }
        }
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
