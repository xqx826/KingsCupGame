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
            if player.has_two {
                SmallerCard(cardRank: Rank.two)
            }
            if player.num_of_eight > 0 {
                HStack {
                    ForEach(0..<player.num_of_eight, id:\.self) { _ in
                        SmallerCard(cardRank: Rank.eight)
                    }
                }
            }
        }
        .onTapGesture {
            print("player \(player.name) is")
            print("Trying to use card")
        }
    }
}

struct PlayerListView: View {
    var players: [Player]
    var body: some View {
        ForEach(players, id: \.name) { player in
            HStack {
            PlayerView(player: player)
                Spacer()
            }
        }
    }
}
