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
    var isCompleted: Bool {model.is_completed}
    public init() {
        self.model = PlayerConfigModel()
    }
    
    public func update_num_players(players_count: Int){
        model.num_of_players = players_count
        print("UPDATED TO: \(model.num_of_players)")
        model.is_completed = is_completed()
        print("IS COMPLETED = \(model.is_completed)")
    }
    
    public func update_name(playerID: Int, name: String) {
        model.names[playerID] = name
        print("Updated name to \(model.names[playerID])")
        model.is_completed = is_completed()
        print("IS COMPLETED = \(model.is_completed)")
    }
    
    public func is_completed() -> Bool {
        for i in 0 ..< model.num_of_players {
            if model.names[i].isEmpty {
                return false
            }
        }
        return true
    }
    
}
