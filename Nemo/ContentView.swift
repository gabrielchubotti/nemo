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
                .tabItem {
                    Label("Home", systemImage: "paperclip.circle")
                }
            
            NotesView()
                .buttonStyle(.borderless)
                .textFieldStyle(.plain)
                .tabItem {
                    Label("Notes", systemImage: "house.circle")
                }
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
