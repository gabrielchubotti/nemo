//
//  ContentView.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 07/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = "Home"
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Home()
                .buttonStyle(.borderless)
                .textFieldStyle(.plain)
                .tabItem {
                    Label("Home", systemImage: "home")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "profile")
                }
        }
      // Home()
       //     .buttonStyle(.borderless)
       //     .textFieldStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
