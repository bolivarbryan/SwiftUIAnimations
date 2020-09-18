//
//  ContentView.swift
//  Shared
//
//  Created by Bryan A Bolivar M on 9/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.2
    
    var body: some View {
        HeartFlip()
            .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
