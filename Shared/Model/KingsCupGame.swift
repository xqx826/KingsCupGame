//
//  KingsCupGame.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import Foundation

public class KingsCupGame {
    public var deck = Deck()
    public var players: [Player]
    public var curr_player: Int = 0
    public var num_k: Int = 0
    public var curr_card: Card?
    
    public init(players: [Player]) {
        self.players = players
        self.curr_card = deck.cards.last
    }
    
    public func discard_card() {
        self.deck.discard_card()
    }
}

