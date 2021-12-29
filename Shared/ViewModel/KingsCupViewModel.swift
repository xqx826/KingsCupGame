//
//  KingsCupViewModel.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import Foundation

public class KingsCupViewModel: ObservableObject {
    private let num_players: Int
    @Published private(set) var model: KingsCupGame
    @Published var curr_card: Card?
    @Published var players: [Player]?
    
    public init(num_players: Int) {
        self.num_players = num_players
        var temp_players: [Player] = []
        for i in 0..<num_players {
            let player = Player(name: String(i))
            if i == 0 {
                player.isPlaying = true
            }
            temp_players.append(player)
        }
        // self.players = temp_players
        self.model = KingsCupViewModel.createGame(players: temp_players)
        self.curr_card = model.curr_card
        // self.curr_player = model.curr_player
        self.players = model.players
        
    }
    
    static func createGame(players: [Player]) -> KingsCupGame {
        return KingsCupGame(players: players)
    }
    
    func flip() {
        model.flip_card()
        self.curr_card = model.curr_card
        self.players = model.players
    }
}
