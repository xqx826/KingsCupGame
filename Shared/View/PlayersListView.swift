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
            Text("\(player.name)")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 200, height: 50)
                .cornerRadius(5)
                .background(player.isPlaying ? Color.highlightedYellow : Color.highlightedGray)
                .cornerRadius(10)
            
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
            viewModel.use_eight(playerID: player.id)
        }
    }
}

struct PlayerListView: View {
    @ObservedObject var viewModel: KingsCupViewModel
    var body: some View {
        let players = viewModel.players!
        ForEach(players, id: \.id) { player in
            HStack {
                PlayerView(viewModel: viewModel, player: player)
                Spacer()
            }
        }
    }
}
