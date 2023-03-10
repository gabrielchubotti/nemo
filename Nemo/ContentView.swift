//
//  ContentView.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 07/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            .buttonStyle(.borderless)
            .textFieldStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
