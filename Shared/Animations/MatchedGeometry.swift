//
//  MatchedGeometry.swift
//  AnimationDemo
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct MatchedGeometry: View {
    @Namespace var nspace
    @State private var circleOnLeft = true
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(alignment: .center, spacing: 30) {
                if circleOnLeft {
                    Circle().fill(Color.red).zIndex(2)
                        .matchedGeometryEffect(id: "group1", in: nspace, properties: .frame, isSource: true)
                        .frame(width: 50, height: 50)
                }
                
                Rectangle().fill(Color.gray).zIndex(1)
                    .frame(width: 20, height: 100)
                
                if !circleOnLeft {
                    Circle().fill(Color.blue).zIndex(2)
                        .matchedGeometryEffect(id: "group1", in: nspace, properties: .frame, isSource: true)
                        .frame(width: 100, height: 100)
                }
            }
            
            Button("Change Circle") {
                withAnimation(.easeInOut(duration: 2.0)) {
                    self.circleOnLeft.toggle()
                }
            }
        }
    }
}

struct MatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometry()
    }
}
