//
//  PlayerConfigModel.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-30.
//

import Foundation

struct PlayerConfigModel {
    var num_of_players: Int = 2
    var names = Array(repeating: "", count: 10)
    var is_completed: Bool = false
}
