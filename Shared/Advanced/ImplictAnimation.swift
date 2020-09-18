//
//  ImplictAnimation.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct ImplictAnimation: View {
    @State private var half = false
    @State private var dim = false
    
    var body: some View {
        Image(systemName: "swift")
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .scaleEffect(half ? 0.5 : 1.0)
            .opacity(dim ? 0.2 : 1.0)
            .animation(.easeInOut(duration: 1.0))
            .onTapGesture {
                self.dim.toggle()
                self.half.toggle()
            }
    }
}

struct ImplictAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplictAnimation()
    }
}
