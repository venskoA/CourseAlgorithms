//
//  ContentView.swift
//  Shared
//
//  Created by Andrey Vensko on 17.07.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
        .onAppear {
            FirstHW()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
