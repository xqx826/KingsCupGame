//
//  PlayersListView.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: KingsCupViewModel
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
            print("player \(player.name) is removing...")
            viewModel.use_eight(playerID: Int(player.name)!)
        }
    }
}

struct PlayerListView: View {
    @ObservedObject var viewModel: KingsCupViewModel
    var body: some View {
        let players = viewModel.players!
        ForEach(players, id: \.name) { player in
            HStack {
                PlayerView(viewModel: viewModel, player: player)
                Spacer()
            }
        }
    }
}
