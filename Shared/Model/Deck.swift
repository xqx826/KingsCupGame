//
//  Deck.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-27.
//

import Foundation

public class Deck {
    var cards: [Card] = []
    
    public init() {
        // create cards
        for rank in Rank.allCases {
            for suit in Suit.allCases {
                cards.append(Card(id: rank.rawValue + suit.rawValue, rank: rank, suit: suit))
            }
        }
        // shuffle
        cards.shuffle()
    }
    
    public func get_length() -> Int {
        return cards.count
    }
    
    public func get_card() -> Card? {
        return cards.last 
    }
    
    public func discard_card() {
        cards.removeLast()
    }
    
}
