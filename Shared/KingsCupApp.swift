//
//  KingsCupApp.swift
//  Shared
//
//  Created by Sherry Xu on 2021-12-27.
//

import SwiftUI

@main
struct KingsCupApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerConfigView()
            // ContentView(gameViewModel: KingsCupViewModel(num_players: 4))
        }
    }
}
