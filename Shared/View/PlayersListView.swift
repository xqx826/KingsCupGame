//
//  PlayersListView.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import SwiftUI

struct PlayerView: View {
    var player: Player
    var body: some View {
        HStack {
            if !player.isPlaying {
                Text("Player \(player.name)")
                    .frame(width: 200, height: 50, alignment: .leading)
                    .background(Color.pink)
        
            } else {
                Text("Player \(player.name)")
                    .frame(width: 200, height: 50)
                    .background(Color.green)
            }
        }
    }
}

struct PlayerListView: View {
    var players: [Player]
    var body: some View {
        // Text("placeholer")
        ForEach(players, id: \.name) { player in
            HStack {
            PlayerView(player: player)
                Spacer()
            }
        }
    }
}
