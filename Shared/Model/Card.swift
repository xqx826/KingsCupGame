//
//  Card.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-27.
//

import Foundation

public enum Suit: Int, CaseIterable {
    case spade = 100
    case heart = 200
    case club = 300
    case diamond = 400
}

public enum Rank: Int, CaseIterable {
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
}

public class Card: Identifiable {
    public var id: Int
    var rank: Rank
    var suit: Suit
    var isFacingUp: Bool = false
    public init(id: Int, rank: Rank, suit: Suit) {
        self.id = id
        self.rank = rank
        self.suit = suit
    }
    
}
