//
//  PlayerConfigViewModel.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-30.
//

import Foundation

public class PlayerConfigViewModel: ObservableObject {
    @Published var model: PlayerConfigModel
    
    var num_players: Int {model.num_of_players}
    var players_name: [String] {model.names}
    
    public init() {
        self.model = PlayerConfigModel()
    }
    
}
