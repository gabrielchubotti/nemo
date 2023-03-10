//
//  NemoApp.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 07/03/23.
//

import SwiftUI

@main
struct NemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
